describe('GroceryItem', () => {
  describe('new GroceryItem()', () => {
    it('takes arguments for the name and quantity', () => {
      let eggs = new GroceryItem('Eggs', 12);

      expect(eggs).toBeDefined();
      expect(eggs.name).toBe('Eggs');
      expect(eggs.quantity).toBe(12);
    });

    it('allows quantity to be an optional argument', () => {
      let bread = new GroceryItem('Loaf of bread');

      expect(bread).toBeDefined();
      expect(bread.name).toBe('Loaf of bread');
      expect(bread.quantity).toBe(1);
    });
  });

  describe('toString()', () => {
    it('returns the string representation of the object', () => {
      let bread = new GroceryItem('Loaf of bread');
      let cheese = new GroceryItem('Cheese', 3);

      expect(bread.toString()).toBe('(1) Loaf of bread');
      expect(cheese.toString()).toBe('(3) Cheese');
    });
  });
});
