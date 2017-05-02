### Introduction

In this tutorial-type exercise, we will use **state** to manage a list of groceries.


### Getting Started

Run the following commands and visit <http://localhost:8080> to see the current state of the application.

```sh
$ et get react-grocery-list-form
$ cd react-grocery-list-form
$ npm install
$ webpack-dev-server
```

Take a moment to orient yourself with the structure of this React application.
What components do we have? How do they relate to each other?

### State

Instead of hard-coding a list of groceries, we would like our application to manage this information. The way we do this within react applications is via
the `state` variable, and the `setState` method.


## Stateful Grocery List

First, let's extract out the event handlers into their own methods.

```javascript
// App.js
import React, { Component } from 'react'
import GroceryForm from './GroceryForm'
import GroceryList from './GroceryList'

class App extends Component {
  constructor(props) {
    super(props)

    this.handleFormSubmit = this.handleFormSubmit.bind(this)
    this.handleButtonClick = this.handleButtonClick.bind(this)
  }

  handleFormSubmit(event) {
    event.preventDefault()
    alert('Form was submitted')
  }

  handleButtonClick(event) {
    alert('Button was clicked')
  }

  render() {
    let groceryData = [
      { id: 1, name: "Oranges" },
      { id: 2, name: "Bananas" },
      { id: 3, name: "Bread" }
    ]

    return(
      <div>
        <h1>Grocery List React</h1>
        <GroceryForm handleFormSubmit={this.handleFormSubmit} />
        <GroceryList
          groceries={groceryData}
          handleButtonClick={this.handleButtonClick}
        />
      </div>
    )
  }
}

export default App
```

When we define functions to the React class, remember we also need to bind them to `this` so that the function knows which component is being utilized.

## Adding Groceries to the List

Having successfully, updated our `App` component to have state, let's now focus now on adding some groceries to our application via the form.

The first step is to move our current groceries into the initial state of `App`. Then we can use `this.state` to pass those groceries to `GroceryList` as a `prop`.

```javascript
// App.js
import React, { Component } from 'react'
import GroceryForm from './GroceryForm'
import GroceryList from './GroceryList'

class App extends Component {
  constructor(props) {
    super(props)
    this.state = {
      groceries: [
        { id: 1, name: "Oranges" },
        { id: 2, name: "Bananas" },
        { id: 3, name: "Bread" }
      ]
    }
    this.handleFormSubmit = this.handleFormSubmit.bind(this)
    this.handleButtonClick = this.handleButtonClick.bind(this)
  }

  handleFormSubmit(event) {
    event.preventDefault()
    alert('Form was submitted')
  }

  handleButtonClick(event) {
    alert('Button was clicked')
  }

  render() {
    return(
      <div>
        <h1>Grocery List React</h1>
        <GroceryForm handleFormSubmit={this.handleFormSubmit} />
        <GroceryList
          groceries={this.state.groceries}
          handleButtonClick={this.handleButtonClick}
        />
      </div>
    )
  }
}

export default App
```

**Note**: If you don't want to have groceries exist by default, you can remove them from state and leave `groceries` as an empty array.

We currently have a problem in our `GroceryForm` component, however.

```javascript
// GroceryForm.js
import React from 'react'

const GroceryForm = (props) => {
  return (
    <form onSubmit={props.handleFormSubmit}>
      <input type="text" placeholder="name of grocery" />
      <input type="submit" value="Add To List" />
    </form>
  )
}

export default GroceryForm
```

On initial rendering, both the virtual DOM and browser DOM have a text `input` element with no value.
If a user types "avocados" into the browser, however, the text `input` element will now have a value of "avocados" in the browser DOM, but the virtual DOM's text `input` will still have no value.
Therefore, our virtual DOM and browser DOM no longer match each other.

We can fix this by adding another property to our `App` component's state and passing another event handler to the `GroceryForm` component. This event handler will watch for changes in the form field's value and update the state accordingly.

```javascript
// App.js
...

class App extends Component {
  constructor(props) {
    this.state = {
      groceries: [],
      name: ''
    }
    ...
    this.handleChange = this.handleChange.bind(this)
  }

  ...

  handleChange(event) {
    let newName = event.target.value
    this.setState({ name: newName })
  }

  render() {
    console.log("App's state name value: ", this.state.name)
    return(
      <div>
        <h1>Grocery List React</h1>
        <GroceryForm
          handleFormSubmit={this.handleFormSubmit}
          handleChange={this.handleChange}
          name={this.state.name}
        />
        <GroceryList
          groceries={this.state.groceries}
          handleButtonClick={this.handleButtonClick}
        />
      </div>
    )
  }
}

export default App
```

```javascript
// GroceryForm.js
import React from 'react'

const GroceryForm = (props) => {
  return (
    <form onSubmit={props.handleFormSubmit}>
      <input
        type="text"
        placeholder="name of grocery"
        value={props.name}
        onChange={props.handleChange}
      />
      <input type="submit" value="Add To List" />
    </form>
  )
}

export default GroceryForm
```

A `name` property has been added to the `App` component's state and with an initial value of an empty string.
The `name` property is now passed down to the `GroceryForm` component instead of a constant value.
Also, the `handleChange` event handler is passed down to `GroceryForm` and is invoked any time there is a change on the text `input` field.
When `handleChange` is run, the `name` property of the `App` component's state is updated to be the value of the text `input` field.

To better visualize how the `name` property in the `App` component's state changes as a user types, we have added a `console.log` in the beginning of the `App` component's render method.
If you open up your browser and type in "avocados" while you have your console open, you will see the following:

![React Stateful Components Photo 17][react-stateful-components-photo-17]

Great! A user can now type into our text `input` field and our virtual and browser DOMs are still in-sync.
What about a user submitting a new grocery?
The `App` component essentially has access to the text in the text `input` field via the `name` property in it's state, so updating our `handleSubmit` function is actually pretty straightforward.
We make the following changes to our code:

```javascript
// App.js
...

class App extends Component {
  ...

  handleFormSubmit(event) {
    event.preventDefault()
    let newId = this.state.groceries[-1].id + 1
    let newGrocery = {
      id: newId,
      name: this.state.name
    }
    let newGroceries = [...this.state.groceries, newGrocery]
    this.setState({
      groceries: newGroceries,
      name: ''
    })
  }

  ...
}

export default App
```

First, we prevent the default behavior of form submission.
Then a grocery object is created with the name from the text `input` field.
It should have a unique `id`, so we find the id of the last grocery of our array and increment the value by 1.
We then create a new array using the current `groceries` in the `App` component's state and append the grocery object we just created.
The last step is to update the component's state with the new groceries and setting the `name` property to an empty string to clear the text `input` field.
If we now go to the application, we should now be able to submit grocery items.

![React Stateful Components Photo 18][react-stateful-components-photo-18]

Boom!

Finally we want to be able to delete groceries.
We will update our `handleButtonClick` event handler and `GroceryList` component to accomplish this.

```javascript
// App.js
...

class App extends Component {
  ...

  handleButtonClick(id) {
    let newGroceries = this.state.groceries.filter(grocery => {
      return grocery.id !== id
    })
    this.setState({ groceries: newGroceries })
  }

  ...
}

export default App
```

```javascript
// GroceryList.js
import React from 'react'
import Grocery from './Grocery'

const GroceryList = (props) => {
  let groceries = props.groceries.map((grocery) => {
    const { id, name } = grocery
    let handleButtonClick = () => props.handleButtonClick(id)

    return (
      <Grocery
        key={id}
        name={name}
        handleButtonClick={handleButtonClick}
      />
    )
  })

  return (
    <ul>
      {groceries}
    </ul>
  )
}

export default GroceryList
```

In our `handleButtonClick` we create a new array of groceries that does not include the grocery whose id was given as an argument to the function using the built-in `filter` JS function.
Then we set the new state of the `App` component using this new array of groceries.
The `handleButtonClick` function is passed in to `GroceryList` through `props`.
In the `map` function, `handleButtonClick` is redefined to execute the `handleButtonClick` pass in through props with the current grocery's `id` as an argument.
This version of `handleButtonClick` is then passed in to each `Grocery` component, and now handles differently and specifically for each grocery when the delete button is clicked.
If we go back to our browser now, we are able to delete grocery items!

![React Stateful Components Photo 19][react-stateful-components-photo-19]

See ya avocados!

## The Final Code

```javascript
// App.js
import React, { Component } from 'react'
import GroceryForm from './GroceryForm'
import GroceryList from './GroceryList'

class App extends Component {
  constructor(props) {
    super(props)
    this.state = {
      groceries: [],
      name: ''
    }

    this.handleFormSubmit = this.handleFormSubmit.bind(this)
    this.handleButtonClick = this.handleButtonClick.bind(this)
    this.handleChange = this.handleChange.bind(this)
  }

  handleFormSubmit(event) {
    event.preventDefault()
    let newId = this.state.groceries[-1].id + 1
    let newGrocery = {
      id: newId,
      name: this.state.name
    }
    let newGroceries = [...this.state.groceries, newGrocery]
    this.setState({
      groceries: newGroceries,
      name: ''
    })
  }

  handleButtonClick(id) {
    let newGroceries = this.state.groceries.filter(grocery => {
      return grocery.id !== id
    })
    this.setState({ groceries: newGroceries })
  }

  handleChange(event) {
    let newName = event.target.value
    this.setState({ name: newName })
  }

  render() {
    return(
      <div>
        <h1>Grocery List React</h1>
        <GroceryForm
          handleFormSubmit={this.handleFormSubmit}
          handleChange={this.handleChange}
          name={this.state.name}
        />
        <GroceryList
          groceries={this.state.groceries}
          handleButtonClick={this.handleButtonClick}
        />
      </div>
    )
  }
}

export default App
```

```javascript
// GroceryForm.js
import React from 'react'

const GroceryForm = (props) => {
  return (
    <form onSubmit={props.handleFormSubmit}>
      <input
        type="text"
        placeholder="name of grocery"
        value={props.name}
        onChange={props.handleChange}
      />
      <input type="submit" value="Add To List" />
    </form>
  )
}

export default GroceryForm
```

```javascript
// GroceryList.js
import React from 'react'
import Grocery from './Grocery'

const GroceryList = (props) => {
  let groceries = props.groceries.map((grocery) => {
    const { id, name } = grocery
    let handleButtonClick = () => props.handleButtonClick(id)

    return (
      <Grocery
        key={id}
        name={name}
        handleButtonClick={handleButtonClick}
      />
    )
  })

  return (
    <ul>
      {groceries}
    </ul>
  )
}

export default GroceryList
```

```javascript
// Grocery.js
import React from 'react'

const Grocery = (props) => {
  return (
    <li>
      {props.name}
      <button type="button" onClick={props.handleButtonClick}>Delete</button>
    </li>
  )
}

export default Grocery
```

Take a few moments to review what you've done. We started with an application
that had a hard-coded list of groceries. Now, we have an application that can
accept user input and manage the **state** of a list of groceries. This was no
easy task, but this example should drive the development of future React
applications!

## Additional Resources

* [React Docs: Forms][react-forms]

[grocery-list-react-design]: https://s3.amazonaws.com/horizon-production/images/grocery_list_react.png
[grocery-list-react-no-styling]: https://s3.amazonaws.com/horizon-production/images/grocery_list_react_no_styling.png
[localhost-8080]: http://localhost:8080
[react-blog-es6-syntax-announcement]: https://facebook.github.io/react/blog/2015/01/27/react-v0.13.0-beta-1.html#plain-javascript-classes
[react-child-reconciliation]: https://facebook.github.io/react/docs/multiple-components.html#child-reconciliation
[react-docs-thinking-in-react]: https://facebook.github.io/react/docs/thinking-in-react.html
[react-forms]: http://facebook.github.io/react/docs/forms.html
[react-fragment-example-repository]: https://github.com/LaunchAcademy/react-stateful-components-react-fragment-example.git
[react-interactivity-and-dynamic-uis]: http://facebook.github.io/react/docs/interactivity-and-dynamic-uis.html
[react-reconciliation]: https://facebook.github.io/react/docs/reconciliation.html
[react-stateful-component-es6-syntax]: https://facebook.github.io/react/docs/reusable-components.html#es6-classes
[react-stateful-components-photo-17]: https://s3.amazonaws.com/horizon-production/images/react-stateful-components-photo-17.png
[react-stateful-components-photo-18]: https://s3.amazonaws.com/horizon-production/images/react-stateful-components-photo-18.png
[react-stateful-components-photo-19]: https://s3.amazonaws.com/horizon-production/images/react-stateful-components-photo-19.png
[react-synthetic-event]: https://facebook.github.io/react/docs/events.html#syntheticevent
[stateful-component-example-repository]: https://github.com/LaunchAcademy/react-stateful-components-stateful-component-example.git
[react-stateful-components-repository]: https://github.com/LaunchAcademy/react-stateful-components.git
