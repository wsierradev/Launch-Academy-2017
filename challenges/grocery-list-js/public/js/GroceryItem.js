// your GroceryItem code, here
class GroceryItem {
  constructor(name, quantity=1) {
    this.name = name;
    this.quantity = quantity;
  }
  toString(){
    return `(${this.quantity}) ${this.name}`
  };
}

module.exports = GroceryItem;
