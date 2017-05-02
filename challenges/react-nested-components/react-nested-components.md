## Learning Objectives

We've learned how to use React to render a page; now it's time to talk about the structure of our React applications. We're going to apply the same guiding principles that we've seen up to this point - SRP, DRY, etc, to the organization of our components and the behavior each one is responsible for. We'll go over how to break down apps into well-organized pieces, and how to effectively re-use those pieces. Finally, we'll talk about a more concise way to define components that don't have any state.

* Learn how to use nested React components
* Learn how to design a React component hierarchy
* Learn about React fragments.
* Know how to use `const` syntax to create **stateless React components**

## Following Along

In this lesson, we will be working from a pre-built application.

Perform the following steps to get started:

```sh
$ cd ~/challenges
$ et get react-nested-components
$ cd react-nested-components
$ npm install
$ webpack-dev-server
```

## Project Description

The new cohort of Launch Academy students are trying to figure out what they need to submit. They think our icons aren't clear enough, so we're going to help them out by creating an icon guide for them! Here are the wireframes provided for this feature:

![Icon Guide React Design][icon-guide-react-design]

Additionally, when a user clicks on an icon, we want to display a popup with a brief description of that lesson type. So far, the current application renders the following static page:

![Icon Guide React Design No Styling][icon-guide-react-no-styling]

The rendering of this page is done through the following code:

```js
// main.js
import './app.scss';
import React from 'react';
import ReactDOM from 'react-dom';
import IconGuide from './components/IconGuide';

ReactDOM.render(
  <IconGuide />,
  document.getElementById('app')
);
```

```js
// IconGuide.js
import React from 'react';

class IconGuide extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    let articleDescription=`These are written lessons that will walk you through
      a particular concept or technique. Don't submit anything for these!`;
    let exerciseDescription=`These assignments are intended to be small, short tasks
     that will allow you to put some of that newly acquired knowledge to work!
     You should submit solutions to all of these via ET!`;
    let challengeDescription=`These assignments are larger, and usually require you to
     put two or three of the new concepts you've learned together.
     You should submit solutions to all of these via ET!`;
    return(
      <div>
        <h2>Launch Academy Icon Guide</h2>
        <p>Here are all the symbols you need to know to understand our curriculum!</p>
        <ul>
          <li onClick={() => alert(articleDescription)} >
            <i className="fa fa-2x fa-fw fa-file-text-o" /> - Article
          </li>
          <li onClick={() => alert(exerciseDescription)} >
            <i className="fa fa-2x fa-fw fa-heartbeat" /> - Exercise
          </li>
          <li onClick={() => alert(challengeDescription)} >
            <i className="fa fa-2x fa-fw fa-puzzle-piece" /> - Challenge
          </li>
        </ul>
      </div>
    );
  }
};

export default IconGuide;
```

Note that the appearance and behavior of the app will more or less stay the same throughout this lesson. We're refactoring an existing app, not building any new features.

### Nested Components

This code is a good starting point, but it's doing all sorts of unspeakable things to the Single Responsibility Principle. The `IconGuide` component is currently responsible for rendering everything on the page. Just as we want our classes and functions to do only one thing, we want our React components to handle only one part of the page.

In order to separate the concerns of our components, we will **nest** them inside one another. That is, we'll call one component from inside another. Nested components are also referred to as **child** components. If this sounds like object composition, that's because it is! We're essentially doing the same thing: pulling out some functionality and encapsulating it in a separate class. The syntax for a nested component looks just like the JSX syntax for calling a component from `main.js`:

```js
//Component1.js

import React from 'react';

class Component1 extends React.Component {
  render() {
    <Component2 />
  }
}
```

Before we get started, we should map out the application's architecture - what components we'll need, and how they will be used - and create a **Component Hierarchy**. To better visualize this process, let's take our app and separate out the different pieces by drawing some boxes around them. Here's the current `IconGuide` component, outlined in red:

![React Icons No Children][icon-guide-react-boxes-no-children]

The `IconGuide` contains everything on the page, but we can definitely divide this page into more granular parts. The list of icons seems like it could be separated from the description at the top, so let's extract that part of the page and turn it into a new component, which we'll call `IconReferenceList` (outlined in orange):

![React Icons One Child][icon-guide-react-boxes-one-child]

Our component hierarchy should now look like this:

* `IconGuide`
  * `IconReferenceList`

This representation shows that `IconReferenceList` is a child component of `IconGuide`. Let's write our new component now:

```js
// IconReferenceList.js
import React from 'react';

class IconReferenceList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    let articleDescription = `These are written lessons that will walk you through
      a particular concept or technique. Don't submit anything for these!`;
    let exerciseDescription = `These assignments are intended to be small, short tasks
     that will allow you to put some of that newly acquired knowledge to work!
     You should submit solutions to all of these via ET!`;
    let challengeDescription = `These assignments are larger, and usually require you to
     put two or three of the new concepts you've learned together.
     You should submit solutions to all of these via ET!`;

    return(
      <div>
        <ul>
          <li onClick={() => alert(articleDescription)} >
            <i className="fa fa-2x fa-fw fa-file-text-o" /> - Article
          </li>
          <li onClick={() => alert(exerciseDescription)} >
            <i className="fa fa-2x fa-fw fa-heartbeat" /> - Exercise
          </li>
          <li onClick={() => alert(challengeDescription)} >
            <i className="fa fa-2x fa-fw fa-puzzle-piece" /> - Challenge
          </li>
        </ul>
      </div>
    );

  }
};

export default IconReferenceList;
```

Now we can simplify our `IconGuide` component by having it call the `IconReferenceList` component as a child:

```js
// IconGuide.js
import React from 'react';
import IconReferenceList from './IconReferenceList';

class IconGuide extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <div>
        <h2>Launch Academy Icon Guide</h2>
        <p>Here are all the symbols you need to know to understand our curriculum!</p>
        <IconReferenceList />
      </div>
    );
  }
};

export default IconGuide;
```

Note that we now need to import the IconReferenceList component in this file.

### Multiple Nested Components

We've made some progress in the right direction, but our list still isn't very DRY. The `<li>` elements all use the same format, so rather than repeating that format three times, we should be able to create an abstraction for them. Let's have another look at the parts of the app:

![React Icons Multiple Children][icon-guide-react-boxes-multiple-children]

We can break down the list of icons even further into individual `Icon`s, but we definitely don't want to have to write a separate component class for each icon. Think back to Object Oriented programming, when you created a class to represent an abstract type of object, and then created multiple instances of that class. You can think of React components in the same way - you're making a blueprint (i.e. a class), and then creating multiple instances of that blueprint. And just like with any other class, we initialize them with different parameters, which we then assign to instance variables. In React, we call those `props` instead!

We can create a component class to represent icons in general, and call it once for each icon in the list, passing in different props each time! Since this new `Icon` component is going to be rendered inside the `IconReferenceList`, we can update our component hierarchy accordingly:

* `IconGuide`
  * `IconReferenceList`
    * `Icon`

Looking at the `li` elements, there are only three differences between them:

![React Icons li Differences][icon-guide-react-li-differences]

The icon name, Font Awesome symbol name, and description are the variables that we will account for in our component. Those will be the props that we pass in when we call it. Now we can define our `Icon` component:

```js
// Icon.js
import React from 'react';

class Icon extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    let iconClass = "fa fa-2x fa-fw " + this.props.fontAwesomeSymbol;
    let iconName = this.props.iconName;
    let descriptionAlert = () => alert(this.props.description);

    return (
      <li onClick={descriptionAlert} >
        <i className={iconClass} /> - {iconName}
      </li>
    );
  }
};

export default Icon;
```

Note that it's not necessary to define local variables in the `render()` function - we could just as easily put the attributes in `props` directly into the `return` value, but it's a bit more readable this way.

Now we can update `IconReferenceList` to call the new `Icon`component, passing in the icon name, the Font Awesome symbol, and the description as props:

```js
// IconReferenceList.js
import React from 'react';
import Icon from './Icon';

class IconReferenceList extends React.Component {
  ...

  render() {
    let articleDescription = `...`
    let exerciseDescription = `...`
    let challengeDescription = `...`

    return(
      <div>
        <ul>
          <Icon
            iconName="Article"
            fontAwesomeSymbol='fa-file-text-o'
            description={articleDescription}
          />
          <Icon
            iconName="Exercise"
            fontAwesomeSymbol='fa-heartbeat'
            description={exerciseDescription}
          />
          <Icon
            iconName="Challenge"
            fontAwesomeSymbol='fa-puzzle-piece'
            description={challengeDescription}
          />
        </ul>
      </div>
    );
  }
};

export default IconReferenceList;
```

### Rendering Lists in React

Sometimes, we won't know ahead of time how many components we will actually have on the page. For example, if we were building a blog page with Comment components, there could be any number of comments that we'd have to display. When you were rendering your pages with ERB, you may have accomplished that by calling `.map` on an array of data.

With React, we can do something similar. If you include an array of React elements in our JSX, React will render them all for you! In our Icon Guide app, this might look something like this:

```js
// IconReferenceList.js

  render() {
    let listOfIcons = [
      <Icon
        key="1"
        iconName="Article"
        fontAwesomeSymbol='fa-file-text-o'
        description="Article Description"
      />
      <Icon
        key="2"
        iconName="Exercise"
        fontAwesomeSymbol='fa-heartbeat'
        description="Exercise Description"
      />
      <Icon
        key="3"
        iconName="Challenge"
        fontAwesomeSymbol='fa-puzzle-piece'
        description="Challenge Description"
      />
    ]

    return(
      <div>
        <ul>
          {listOfIcons}
        </ul>
      </div>
    );
  }
```

Note the addition of the `key` prop to the `Icon` Components. When rendering an array of components, React needs to be able to keep track of the identity of items that are changed, added, or removed. Therefore, we must pass in a unique `key` prop for each child element.

This example is actually a poor one, since we always know how many Icons we're going to render. In general, you should only use an embedded list if the following conditions are met:

1. The number of children elements may vary.
2. All of the children are of the same type and share the same properties.

This format might make sense if, for example, a user could add or remove icons from the list. As it is now, though, there's no reason to put our Icons in an array.

### Stateless Components

The new architecture for our app is certainly more flexible, not to mention easier to read, but our codebase has effectively tripled in size. A lot of that is boilerplate in our class files. Fortunately, React provides a simpler way to define components without using classes, as long as those components don't need to keep track of state.

In our app, none of our components use state, which means they are **functional**. Given the same input, they will always produce the same output. Therefore, we can represent a stateless component as, you guessed it, a **function**!

To define a stateless component, we assign a variable to an arrow function. An important aspect here is that the variable name **must** be capitalized.
This arrow function should take in a `props` object as an argument and return a single React element (just as a component defined as class must have a `render` method that returns a single element).

For example, we can refactor our `IconGuide` component like so:

```js
// IconReferenceList.js
import React from 'react';
import IconReferenceList from './IconReferenceList';

const IconGuide = (props) => {
    <div>
      <h2>Launch Academy Icon Guide</h2>
      <p>Here are all the symbols you need to know to understand our curriculum!</p>
      <IconReferenceList />
    </div>
  }
};

export default IconGuide;
```

`const` syntax can make small stateless components much easier to read, but they're not necessary - your code will work just as well without them. You can always use the `class` syntax that we've been using up until now to define any component.

## Summary

This article has demonstrated how to use nested components to structure a React application. In doing so, we have enforced the Single Responsibility Principle and reduced the complexity of our components, while also increasing maintainability.
We have learned how to use arrays in JS to render dynamic children.
We have also learned how to use `const` syntax to create stateless components, which helps to reduce repetition in our code.

## Additional Resources

* [React ES6 Syntax for Stateless Components][react-stateless-component-es6-syntax]
* [React Multiple Components][react-multiple-components]
* [React Lists and Keys][react-lists-and-keys]

[icon-guide-react-design]: https://s3.amazonaws.com/horizon-production/images/icon-guide-react-design.png
[icon-guide-react-no-styling]: https://s3.amazonaws.com/horizon-production/images/icon-guide-react-no-styling.png
[icon-guide-react-boxes-no-children]: https://s3.amazonaws.com/horizon-production/images/icon-guide-react-boxes-no-children.png
[icon-guide-react-boxes-one-child]: https://s3.amazonaws.com/horizon-production/images/icon-guide-react-boxes-one-child.png
[icon-guide-react-boxes-multiple-children]: https://s3.amazonaws.com/horizon-production/images/icon-guide-react-boxes-multiple-children.png
[icon-guide-react-li-differences]: https://s3.amazonaws.com/horizon-production/images/icon-guide-react-li-differences.png
[react-multiple-components]: https://facebook.github.io/react/docs/multiple-components.html
[react-stateless-component-es6-syntax]: https://facebook.github.io/react/docs/reusable-components.html#stateless-functions
[react-lists-and-keys]: https://facebook.github.io/react/docs/lists-and-keys.html
