describe('Circle', () => {
  describe('new Circle()', () => {
    it('takes argument for the radius', () => {
      let circle = new Circle(12);

      expect(circle).toBeDefined();
      expect(circle.radius).toBe(12);
    });

    it('takes optional argument for the center', () => {
      let circle = new Circle(12, 1, 2);

      expect(circle).toBeDefined();
      expect(circle.x).toBe(1);
      expect(circle.y).toBe(2);
    });

    it('defaults (x,y) to (0,0) if not provided', () => {
      let circle = new Circle(12);

      expect(circle).toBeDefined();
      expect(circle.x).toBe(0);
      expect(circle.y).toBe(0);
    });
  });

  describe('diameter()', () => {
    it('returns the diameter of the circle', () => {
      let circle = new Circle(12);

      expect(circle.diameter()).toBe(24);
    });
  });

  describe('area()', () => {
    it('returns the area of the circle', () => {
      let circle = new Circle(12);

      expect(Math.round(circle.area())).toBe(452);
    });
  });

  describe('perimeter()', () => {
    it('returns the perimeter of the circle', () => {
      let circle = new Circle(12);

      expect(Math.round(circle.perimeter())).toBe(75);
    });
  });
});
