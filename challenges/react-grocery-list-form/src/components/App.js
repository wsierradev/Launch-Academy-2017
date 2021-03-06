import React, { Component } from 'react'
import GroceryForm from './GroceryForm.js'
import GroceryList from './GroceryList.js'

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
