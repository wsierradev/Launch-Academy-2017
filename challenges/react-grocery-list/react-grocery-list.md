# Grocery List Time!

Refactor a React Grocery List app to use nested components.


## Getting Started

Run the following commands and visit <http://localhost:8080> to see the current state of the application.

```sh
$ et get react-grocery-list
$ cd react-grocery-list
$ npm install
$ webpack-dev-server
```

You should see the following static application in your browser:

![Grocery List React No Styling][grocery-list-react-no-styling]


Your task is to **break the application up into smaller, nested React components**.

```no-highlight
App
  └── GroceryList
        └── Grocery
```

Your `App.js` file will end up looking something like this:

```javascript
// src/components/App.js
...
import GroceryList from './GroceryList';
...
  render() {
    let groceryData = [
      { id: 1, name: "Oranges" },
      { id: 2, name: "Bananas" },
      { id: 3, name: "Bread" }
    ];

    return(
      <div>
        ...
        <GroceryList groceries={groceryData} handleButtonClick={ (event) => { alert('Button was clicked')} }/>
      </div>
    );
  }    
...
```

`props` are passed down to the `GroceryList` and `Grocery` components in order to
set their attributes.


{% show_hint %}

* Create files for the `GroceryList` and `Grocery` components in the `src/components` folder.
* Make sure to `export` the components at the end of the files
* `import` these components in the `App.js` file.
* Utilize `props` to set the attributes on the `GroceryList` and `Grocery` components.

{% endshow_hint %}


{% show_solution %}

```javascript
// src/main.js
import './app.scss';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';

ReactDOM.render(
  <App />,
  document.getElementById('app')
);
```

```javascript
// src/components/App.js
class App extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    let groceryData = [
      { id: 1, name: "Oranges" },
      { id: 2, name: "Bananas" },
      { id: 3, name: "Bread" }
    ];
    return(
      <div>
        <h1>Grocery List React</h1>
        <form onSubmit={ (event) => { event.preventDefault(); alert('Form was submitted'); } }>
          <input type="text" placeholder="name of grocery" />
          <input type="submit" value="Add To List" />
        </form>

        <GroceryList groceries={groceryData} handleButtonClick={ (event) => { alert('Button was clicked')} }/>
      </div>
    );
  }
};
```

```javascript
// src/components/GroceryList.js
import React from 'react';
import Grocery from './Grocery';

const GroceryList = (props) => {
  let groceries = props.groceries.map((grocery) => {
    return (
      <Grocery
        key={grocery.id}
        name={grocery.name}
        handleButtonClick={props.handleButtonClick}
      />
    );
  });

  return (
    <ul>
      {groceries}
    </ul>
  );
};

export default GroceryList;
```

```javascript
// src/components/Grocery.js
import React from 'react';

const Grocery = (props) => {
  return (
    <li>
      {props.name}
      <button type="button" onClick={props.handleButtonClick}>Delete</button>
    </li>
  );
};

export default Grocery;
```

{% endshow_solution %}


## Additional Resources

* [React Docs: ES6 Syntax for Stateful Components][react-stateful-component-es6-syntax]
* [React Blog: ES6 Class Syntax Announcement][react-blog-es6-syntax-announcement]
* [React Docs: Interactivity and Dynamic UIs][react-interactivity-and-dynamic-uis]
* [React Docs: Reconciliation][react-reconciliation]
* [React Docs: Child Reconciliation][react-child-reconciliation]
* [React Docs: Thinking In React][react-docs-thinking-in-react]

[grocery-list-react-no-styling]: https://s3.amazonaws.com/horizon-production/images/grocery_list_react_no_styling.png
[react-blog-es6-syntax-announcement]: https://facebook.github.io/react/blog/2015/01/27/react-v0.13.0-beta-1.html#plain-javascript-classes
[react-child-reconciliation]: https://facebook.github.io/react/docs/multiple-components.html#child-reconciliation
[react-docs-thinking-in-react]: https://facebook.github.io/react/docs/thinking-in-react.html
[react-fragment-example-repository]: https://github.com/LaunchAcademy/react-stateful-components-react-fragment-example.git
[react-interactivity-and-dynamic-uis]: http://facebook.github.io/react/docs/interactivity-and-dynamic-uis.html
[react-reconciliation]: https://facebook.github.io/react/docs/reconciliation.html
[react-stateful-component-es6-syntax]: https://facebook.github.io/react/docs/reusable-components.html#es6-classes
