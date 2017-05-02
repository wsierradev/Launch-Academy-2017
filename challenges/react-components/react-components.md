## Learning Objectives

* Learn how to use React components
* Understand how data is passed in and used within Components
* Use React components to add user interactivity to our page

## Following Along - Code Example

To get quickly set up, run the following:

```sh
$ et get react-components
$ cd react-components
$ npm install
$ webpack-dev-server
```

## React Components

React Components often need to be dynamic and respond to user interface (UI) events, server events, and even the passage of time.
Thus, we need a way for components to update what they render under different circumstances. This is dependent on the data associated to our React Components.

To begin our dive into React Components, we begin with the following two files:

```javascript
// src/main.js
import React from 'react';
import ReactDOM from 'react-dom';
import MessageComponent from './components/MessageComponent';

ReactDOM.render(
  <MessageComponent />,
  document.getElementById('app')
);
```

```javascript
// src/components/MessagesComponent.js
import React from 'react';

class MessageComponent extends React.Component {
  render() {
    return(
      <div>
        <h1>Component Message: Hi!</h1>
      </div>
    );
  }
};

export default MessageComponent;
```

Here we use [ES6 class syntax][introduction-to-es6-classes] to inherit from `React.Component`. This defines a new class, which can create React Component instances.

Booting up our Webpack Dev Server and going to <http://localhost:8080> will display the following in the browser:

![React Stateful Components Photo 1][react-stateful-components-photo-1]

One important aspect of interactive User Interfaces (UIs) is the storage of data. With React Components, there are two main ways of storing data, with the first being through the use of static properties, also known as `props`.

## React Props

Properties, or `props`, can play two roles. The first is to give a JSX tag an HTML property, such as `id`, `className`, or define event handlers, or define other html properties. However, `props` can also be used for data flow into React Components.

When we want to pass information about what our `MessageComponent` will say, we must start from the file which calls and utilizes an instance of the component.
Here is an example of passing data into a `MessageComponent`:

```javascript
// src/main.js
import React from 'react';
import ReactDOM from 'react-dom';
import MessageComponent from './components/MessageComponent';

ReactDOM.render(
  <MessageComponent message="Hello from main.js" />,
  document.getElementById('app')
);
```

`<MessageComponent message="hi" />` is calling an instance of a `MessageComponent` with a key-value property of `message="hi"` as opposed to solely a props-less `MessageComponent` we had before: `<MessageComponent />`

Booting up our Webpack Dev Server and going to <http://localhost:8080> will display the following in the browser:

![React Stateful Components Photo 1][react-stateful-components-photo-1]

What gives? We have explicitly changed the message we want to show in `main.js`, but we haven't implemented the utilization of `props` from within our component  class. Let's take a dive into the `MessageComponent` file and see where props lives. Let's add a `debugger` right before the `return` call within our render method:

```javascript
// src/components/MessageComponent.js
import React from 'react';

class MessageComponent extends React.Component {
  render() {
    debugger;
    return(
      <div>
        <h1>Component Message: Hi!</h1>
      </div>
    );
  }
};

export default MessageComponent;
```

If we check what `this.props` is in the console, you should see the following result:

![React Stateful Components Photo 2][react-stateful-components-photo-2]

Even though we have passed props into the instance of `MessageComponent`, we have no constructor for the class definition of `MessageComponent` to associate the passed in `props` to `this`. Let's fix this by defining a constructor:

```javascript
// src/components/MessageComponent.js
import React from 'react';

class MessageComponent extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    debugger;
    return(
      <div>
        <h1>Component Message: Hi!</h1>
      </div>
    );
  }
};

export default MessageComponent;
```

The constructor takes in `props` as an argument, and calls `super`. In this context, `super` represents the `constructor` method defined within the `React.Component` class `MessageComponent` is inheriting from. Ultimately, this will set the `props` on the component.

We can check `this.props` in our debugger and see the following result:

![React Stateful Components Photo 3][react-stateful-components-photo-3]

As you can see, the message property passed in from `main.js` is now available as a key value pair within `this.props`. This is the main workflow for passing data to a component.

We can now use a JSX expression to display the message from `this.props`, instead of hard-coding the message:

```javascript
// src/components/MessageComponent.js
import React from 'react';

class MessageComponent extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <div>
        <h1>Component Message: {this.props.message}</h1>
      </div>
    );
  }
};

export default MessageComponent;
```

Here we are calling the `message` key from `this.props` to display the value as the component message. We should see the following changes updated in the browser:

![React Stateful Components Photo 4][react-stateful-components-photo-4]

## React State

`props` are considered to be static; they cannot be changed. When the data in our application changes, how can we update a component to show the latest information?  Luckily, there is a second form of data storage on React Components known as `state`.

`state` can be assigned to `this` of the class in the `constructor` and set to a JS object, like so:

```javascript
// src/components/MessageComponent.js
import React from 'react';

class MessageComponent extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      clickCount: 0,
      sender: 'Davy Jones'
    };
  }

  render() {
    return(
      <div>
        <h1>Component Message: {this.props.message}</h1>
        <h1>Component Click Count: {this.state.clickCount}</h1>
        <h1>Component Sender: {this.state.sender}</h1>
      </div>
    );
  }
};

export default MessageComponent;
```

Within the component constructor, we set `this.state` to a plain old JavaScript object. We can access the data in this state object via `this.state` in the other methods in the class.
In this example, we have set initial object state to have a `clickCount` of `0` and a `sender` of `'Davy Jones'`.
In the browser, we will see the following:

![React Stateful Components Photo 5][react-stateful-components-photo-5]

The component is now stateful and is displaying the data from its state, but the page is still static.
It would make sense for the component's `clickCount` to increase every time the component is clicked.
To do so, we need to update the state in response to a click event:

```javascript
// src/components/MessageComponent.js
import React from 'react';

class MessageComponent extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      clickCount: 0,
      sender: 'Davy Jones'
    };

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(event) {
    let newClickCount = this.state.clickCount + 1;
    this.setState({ clickCount: newClickCount });
  }

  render() {
    return(
      <div onClick={this.handleClick}>
        <h1>Component Message: {this.props.message}</h1>
        <h1>Component Click Count: {this.state.clickCount}</h1>
        <h1>Component Sender: {this.state.sender}</h1>
      </div>
    );
  }
};

export default MessageComponent;
```

We have added an `onClick` event listener to the `div` element encompassing our component and used the `handleClick` method as the event handler.
In this event handler, we simply want to determine the new click count value and update the state with the new click count value.

To change component state, we use the `setState` method which was inherited from `React.Component` and call it with an object containing only the properties that need to be updated.
Most importantly, the `setState` method will trigger a re-rendering of the component with the new state and the browser page will be updated.

If we take a look at the browser now, we will see that the click count increments by one every time we click on the component! Notice that even though the sender is a part of state, our application is not changing it all.

### Critical Details

Before we review the process again, please be mindful of the following details:

- **Only ever change state via the `setState` method** - Otherwise, you will inadvertently delete state properties and fail to trigger the re-rendering of the component.

- **It is usually necessary to bind `this` to event handlers** - For any event handlers that use `this` and are passed down as `props` to ReactElements in your `render` method, you must bind `this` in the last line of the `constructor` method. Without binding `this`, you may encounter situations where the event handler is not referring to the object in question.

### Rendering on State Change

If you would like to gain a deeper understanding of component state, follow along
with the instructions in this section.

Let's add a `debugger` to the beginning of our `handleClick` and `render` methods and go through the component's initial rendering and the re-rendering whenever it is clicked.

```
// src/components/MessageComponent.js
// ...

  handleClick(event) {
    debugger;
    let newClickCount = this.state.clickCount + 1;
    // ...
  }

  render() {
    debugger;
    return(
    // ...
  }
};

export default MessageComponent;
```

After making these changes, our Webpack Dev Server will automatically refresh the page for us and we will be in step 1 of the process.

#### Step 1. `render` is called for the initial rendering of the page.

![React Stateful Components Photo 6][react-stateful-components-photo-6]

There is nothing on the page because the `render` method has not returned the initial representiation of the component.
Exiting out of this debugger will take us to step 2.

#### Step 2. Page shows rendered component with initial state.

![React Stateful Components Photo 5][react-stateful-components-photo-5]

This displays the component's prop data and initial state data.
Clicking on the component will take us to step 3.

#### Step 3. Click event is triggered and event handler is invoked.

![React Stateful Components Photo 7][react-stateful-components-photo-7]

Here we are determining the new state and then calling `setState` to update the state and re-render the component.
Exiting out of this debugger will take us to step 4.

#### Step 4. `render` is called again to re-render the component.

![React Stateful Components Photo 8][react-stateful-components-photo-8]

At this point in time, the component has the new state. However, the page has not been updated because the `render` method has not returned the updated representation of the component.
Exiting out of this debugger will take us to step 5.

#### Step 5. Page shows re-rendered component with the new state.

![React Stateful Components Photo 9][react-stateful-components-photo-9]

If we were to click on the component again, steps 3-5 would be repeated.

One final refactoring we can do is to import `Component` directly from the `react` package, so we can write `extends Component` instead of `extends React.Component`.

```javascript
// MessageComponent.js
import React, { Component } from 'react';

class MessageComponent extends Component {
...
};

export default MessageComponent;
```

## React Virtual DOM

You may be wondering how our React application updates the browser's DOM when the state of a component changes.

There are two libraries working together to achieve this: `React` and `ReactDOM`.
The React library creates a virtual representation of the DOM (virtual DOM), while `ReactDOM` does the _actual_ browser DOM manipulation based on the components stored in the virtual DOM.
Every time a component is re-rendered (e.g.- state changes), the React library creates a new virtual DOM.

A naive approach to update the browser DOM would be to delete the entire browser DOM and replace it with the new virtual DOM equivalent.
The problem with this is that browser DOM manipulation is an expensive operation, so React applications would be slow if this approach was taken.
However, what the React library does instead is it compares the newly generated virtual DOM with the previous virtual DOM and determines if there are any differences.
If there are no differences, then ReactDOM does not touch the browser's DOM.
However, if there are differences, then ReactDOM will perform the minimal amount of changes to the browser's DOM, so it matches the new virtual DOM.

The process of manipulating the browser DOM so it matches the new virtual DOM is known as **reconciliation**.


## Summary

React components allow us to make our pages dynamic so they respond to UI events, server events, and the passage of time.
These components take in two forms of data. `props` comes from information passed into the instance of the component and remains static throughout an applications lifespan.
`state` on the other hand, can be changed using the `setState` method within a defined event handler.
Whenever a component updates its state, our React application utilizes the React library to generate a new updated virtual DOM.

This new virtual DOM is compared against the previous virtual DOM, and if there are any differences between these virtual DOMs, then the ReactDOM library will update our browser DOM, so it is up-to-date with our new virtual DOM. To put it more simply, React knows exactly what parts of the web page to change when the state changes.

With this knowledge of a stateful component, you are now equipped to begin creating dynamic React applications.

## Additional Resources
* [React Docs: ES6 Syntax for Stateful Components][react-stateful-component-es6-syntax]
* [React Blog: ES6 Class Syntax Announcement][react-blog-es6-syntax-announcement]
* [React Docs: Interactivity and Dynamic UIs][react-interactivity-and-dynamic-uis]
* [React Docs: Thinking In React][react-docs-thinking-in-react]

[introduction-to-es6-classes]: https://learn.launchacademy.com/lessons/introduction-to-es6#classes
[localhost-8080]: http://localhost:8080
[react-blog-es6-syntax-announcement]: https://facebook.github.io/react/blog/2015/01/27/react-v0.13.0-beta-1.html#plain-javascript-classes
[react-docs-thinking-in-react]: https://facebook.github.io/react/docs/thinking-in-react.html
[react-interactivity-and-dynamic-uis]: http://facebook.github.io/react/docs/interactivity-and-dynamic-uis.html
[react-stateful-component-es6-syntax]: https://facebook.github.io/react/docs/reusable-components.html#es6-classes
[react-stateful-components-photo-1]: https://s3.amazonaws.com/horizon-production/images/react-stateful-components-photo-1.png
[react-stateful-components-photo-2]: https://s3.amazonaws.com/horizon-production/images/react-stateful-components-photo-2new.png
[react-stateful-components-photo-3]: https://s3.amazonaws.com/horizon-production/images/react-stateful-components-photo-3new.png
[react-stateful-components-photo-4]: https://s3.amazonaws.com/horizon-production/images/react-stateful-components-photo-4new.png
[react-stateful-components-photo-5]: https://s3.amazonaws.com/horizon-production/images/react-stateful-components-photo-5new.png
[react-stateful-components-photo-6]: https://s3.amazonaws.com/horizon-production/images/react-stateful-components-photo-6new.png
[react-stateful-components-photo-7]: https://s3.amazonaws.com/horizon-production/images/react-stateful-components-photo-7new.png
[react-stateful-components-photo-8]: https://s3.amazonaws.com/horizon-production/images/react-stateful-components-photo-8new.png
[react-stateful-components-photo-9]: https://s3.amazonaws.com/horizon-production/images/react-stateful-components-photo-9new.png
[react-stateful-components-photo-10]: https://s3.amazonaws.com/horizon-production/images/react-stateful-components-photo-8.png
[react-stateful-components-photo-11]: https://s3.amazonaws.com/horizon-production/images/react-stateful-components-photo-9.png
[react-stateful-components-photo-12]: https://s3.amazonaws.com/horizon-production/images/react-stateful-components-photo-10.png
[react-synthetic-event]: https://facebook.github.io/react/docs/events.html#syntheticevent
[stateful-component-example-repository]: https://github.com/LaunchAcademy/react-stateful-components-stateful-component-example.git
