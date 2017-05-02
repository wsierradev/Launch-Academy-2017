## Learning Objectives

* Learn about the mounting, updating, and unmounting lifecycle phases.
* Understand when to use lifecycle methods.

## Follow Along

To get set up, run the following:

```sh
$ et get react-component-lifecycle
$ cd react-component-lifecycle
$ npm install
$ webpack-dev-server
```

Point your browser to <http://localhost:8080> and open up the Chrome Developer Tools. There should be two buttons on the page, and no JavaScript errors.

## React Lifecycle Methods

There may be times when we want to run code at certain points in the component's
lifecycle. For example, we may want to run code before the component is rendered
to the browser's DOM. If we are having performance issues, we may even want to
control whether or not a component re-renders itself. By using **React lifecycle
methods**, we have the ability to execute code at different points in the
lifetime of a component.

Components can undergo three phases during their existence: **mounting**,
**updating**, and **unmounting**.


## Mounting Phase

In the **mounting phase**, the component is added to the page.

The `render` method contains the HTML, and other components, which will be
displayed in the browser.

Before `render` is executed, `componentWillMount` is called, if defined. After
a component has rendered, `componentDidMount` will be executed.

The execution of these three methods is the **mounting phase** for a component.

As React developers, we can utilize the `componentWillMount` and `componentDidMount`
methods. This gives us the flexibility to perform tasks when a
component hits certain points in its lifecycle.

**A very common use case for lifecycle methods, is to fetch some data before a
component is rendered**.


## Unmounting Phase

In the **unmounting phase**, a component is removed from the page.

The unmounting phase will call the `componentWillUnmount` method.

Add the following code to the `Picture` component:

```javascript
// Picture.js

let wait = (milliseconds) => {
  let startTime = new Date().getTime()
  var currentTime = startTime
  while (currentTime < startTime + milliseconds) {
    currentTime = new Date().getTime()
  }
}

class Picture extends Component {
  // ...

  componentWillMount() {
    console.log("** componentWillMount **")
    console.log("render() is about to be called, and the Picture component will appear...")
    wait(1000)
  }

  componentDidMount() {
    console.log("** componentDidMount **")
    console.log("render() was just called.")
  }

  componentWillUnmount() {
    console.log("** componentWillUnmount **")
    console.log("Say 'Goodbye,' to the Picture component...")
    wait(1000)
  }

  // ...
}
```


Refresh the browser and click on the "Mount Picture" button.

If we now click the "Unmount Picture" button, we will enter the unmounting phase of the component's lifecycle and execution.


## Updating Phase

After a component has mounted, not only can it now undergo its unmounting phase, but also it can now undergo its **updating phase**.
Once, a component completes its updating phase, it again has the option to undergo either its unmounting phase or updating phase.
Components enter their updating phase when they receive either new props from their parent component or a new state via invoking `setState`.
After the child component is mounted in our application, clicking on the "Straighten Picture" button will cause the `Wall` component to re-render itself and pass down an updated `straightenCount` prop to the `Picture` component. The `Picture` component enters its **updating phase** because it received new props.

Alternatively, clicking on the "Clean Glass" or "Touch Glass" buttons will cause the `Picture` component to change its state and enter its updating phase because it now has a new state.

We have access to the following methods in the updating phase:

* `componentWillReceiveProps(nextProps)`
* `shouldComponentUpdate(nextProps, nextState)`
* `componentWillUpdate(nextProps, nextState)`
* `componentDidUpdate(previousProps, previousState)`

Add these methods to the `Picture` component, and experiment with them. The following
image describes the order in which these methods are called.

![React Lifecycle](https://s3.amazonaws.com/horizon-production/images/react-lifecycle.png)

## Using React Lifecycle Methods

Lifecycle methods allow us to hook into the component lifecycle and run code before or after certain events.
However, using lifecycle methods increases the complexity of your component and decreases maintainability of the code because these methods tend to create side effects in your application.
Additionally, misusing these methods can create bugs that are difficult to track down.
For example, `shouldComponentUpdate` can be used to make your application more efficient, but an erroneous implementation of this method may cause your application to not re-render correctly.
Thus, you should use only the lifecycle methods that you need.
The two most common lifecycle methods that are used in components are `componentDidMount` and `componentWillUnmount`, so learning when these methods are invoked and when to use them is the best use of your time when first learning about lifecycle methods.
To further aid you in learning about lifecycle methods, we have created the following three tables which summarize all the lifecycle methods and their most common use cases:

### Mounting Phase

| Method | Description | Use Case |
| ------ | ----------- | -------- |
| componentWillMount | Invoked before mounting. | Update the state of the component before it is rendered and/or any necessary operations before initial rendering. |
| render             | Invoked to render the component. | Required in every component. |
| componentDidMount  | Invoked after mounting. |  Update the state of the component with data from a server (via the Fetch API, AJAX, XMLHTTPRequest, etc.), open a WebSocket connection, add event listeners, set timers via `setTimeout` or `setInterval`, and/or integrate third-party libraries. At this point, you may also manipulate the browser DOM.  |

### Updating Phase

| Method | Description | Use Case |
| ------ | ----------- | -------- |
| componentWillReceiveProps | **If the component is receiving new props**, invoked before `shouldComponentUpdate`. This method receives the next props as an argument. | Update the state of the component based on the next props. |
| shouldComponentUpdate | Invoked to decide whether or not to proceed in the updating phase of the lifecycle. This method receives next props and next state as arguments. | Optimize speed of application by preventing unnecessary re-rendering. |
| componentWillUpdate | Invoked before re-rendering. This method receives next props and next state as arguments. **Note:** `this.setState` cannot be called in this method. | Perform any operations in preparation for re-rendering. |
| render             | Invoked to render the component. | Required in every component. |
| componentDidUpdate | Invoked after re-rendering. This method receives the previous props and previous state as arguments.  | Perform any operations that use the re-rendered DOM. |

### Unmounting Phase

| Method | Description | Use Case |
| ------ | ----------- | -------- |
| componentWillUnmount | Invoked before unmounting occurs. | Cleanup anything set up in `componentDidMount` if need be (i.e. close Websocket connections, remove event listeners, clear timers, revert browser DOM manipulation, etc.). |

## Summary

Lifecycle methods allow us to run code at specific points in the React component
lifecycle.

By using lifecycle methods, we have the ability to run code that...

  * updates our components as soon as they have been rendered
  * integrates third-party libraries that require access to the underlying DOM
  * cleans-up any side effects before components are removed from the DOM
  * prevents unnecessary rendering of components

In future articles, we will be leveraging lifecycle methods to improve both the
user experience and our code base.

## Additional Resources

* [React Docs: Component Lifecycle][react-docs-component-lifecycle]
* [React Docs: Component Specs And Lifecycle][react-docs-component-specs-and-lifecycle]

[react-docs-component-lifecycle]: http://facebook.github.io/react/docs/working-with-the-browser.html#component-lifecycle
[react-docs-component-specs-and-lifecycle]: http://facebook.github.io/react/docs/component-specs.html
