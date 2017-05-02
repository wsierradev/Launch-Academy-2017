let inventory = [
  ['LA-LG-STICKER', 300, 'Large Sticker', 'images/la-large-sticker-256px.png', 'Show your Launch pride by plastering your laptop with these beautiful die-cut stickers.'],
  ['LA-SM-STICKER', 200, 'Small Sticker', 'images/la-small-sticker-128px.png', 'It\'s a tiny Launch sticker. How cute!'],
  ['LA-T-SHRIT', 50, 'T-Shirt', 'images/la-t-shirt-200px.png', '100% Cotton. Makes a great gift.']
]

class Product {
  constructor(id, quantity, name, image, description){
      this.id = id
      this.quantity = quantity
      this.name = name
      this.image = image
      this.description = description
  }
  sell() {
    this.quantity --
}

  toHtml() {
  let productHtml = `<div class='product'>
     <h1>Product Name: ${this.name}</h1>
     <h5>${this.quantity} In Stock</h5>
     <img src="${this.image}" alt="${this.name}" />
     <h3>Description</h3>
     <p> ${this.description} </p>
     </div>`;
    return productHtml;
  }
}


let allProducts = (product) => {
  return item = new Product(...product);
}

let productsArray = inventory.map(allProducts)

element = document.getElementById('all-products')

productsArray.forEach((product) => {
  element.innerHTML += product.toHtml()
})
