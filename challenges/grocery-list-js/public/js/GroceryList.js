// your GroceryList code, here
class GroceryList {
  constructor(title, date) {
    this.title = title;
    this.date = date;
    this.items = [];
    this.addItem = (item) => {
    this.items.push(item);
    }
  }
    toHTML() {
    let stringArray = [];
    stringArray.push("<h1>" + this.title + "</h1>");
    stringArray.push("<h3>" + this.date + "</h3>");
    stringArray.push("<ul>");
    for(let i = 0; i < this.items.length; i++){
      stringArray.push("<li>" + this.items[i].toString() + "</li>");
    };
    stringArray.push("</ul>");
    return stringArray.join("\n");
  };
}
