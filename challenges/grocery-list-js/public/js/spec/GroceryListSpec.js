describe('GroceryList', () => {
  describe('new GroceryList()', () => {
    it('takes arguments for the store name and date', () => {
      let groceryList = new GroceryList('Market Basket', '2016/09/02');

      expect(groceryList).toBeDefined();
      expect(groceryList.title).toBe('Market Basket');
      expect(groceryList.date).toBe('2016/09/02');
    });

    it('initalizes an empty array of items', () => {
      let groceryList = new GroceryList('Market Basket', '2016/09/02');

      expect(groceryList.items).toEqual([]);
    });
  });

  describe('addItem()', () => {
    it('adds an item to the grocery list', () => {
      let bread = new GroceryItem('Loaf of bread');
      let groceryList = new GroceryList('Market Basket', '2016/09/02');
      groceryList.addItem(bread);

      expect(groceryList.items).toEqual([bread]);
    });
  });

  describe('toHTML()', () => {
    it('returns the HTML representation of the object', () => {
      let eggs = new GroceryItem('Eggs', 12);
      let bread = new GroceryItem('Loaf of bread');
      let milk = new GroceryItem('Gallon of milk', 2);
      let groceryList = new GroceryList('Market Basket', '2016/09/02');
      groceryList.addItem(eggs);
      groceryList.addItem(bread);
      groceryList.addItem(milk);

      let htmlGroceryList = [
        '<h1>Market Basket</h1>',
        '<h3>2016/09/02</h3>',
        '<ul>',
        '<li>(12) Eggs</li>',
        '<li>(1) Loaf of bread</li>',
        '<li>(2) Gallon of milk</li>',
        '</ul>'
      ].join('\n');
      expect(groceryList.toHTML()).toBe(htmlGroceryList);
    });
  });
});
