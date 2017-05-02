describe('Square', () =>  {
  describe('new Square()', () =>  {
    it('takes argument for a length of a side', () =>  {
      let square = new Square(2);

      expect(square).toBeDefined();
    });

    it('takes optional argument for the center point', () =>  {
      let square = new Square(2, 1, 3);

      expect(square).toBeDefined();
      expect(square.x).toEqual(1);
      expect(square.y).toEqual(3);
    });

    it('defaults (x,y) to (0,0) if not provided', () =>  {
      let square = new Square(2);

      expect(square.x).toEqual(0);
      expect(square.y).toEqual(0);
    });
  });

  describe('area()', () =>  {
    it('returns the area of the square', () =>  {
      let square = new Square(2);
      expect(square.area()).toEqual(4);
    });
  });

  describe('perimeter()', () =>  {
    it('returns the perimeter of the square', () =>  {
      let square = new Square(2);
      expect(square.perimeter()).toEqual(8);
    });
  });

  describe('contains_point?(x,y)', () =>  {
    it('returns true for a point given inside of the square\'s perimeter', () => {
      let square = new Square(2);
      expect(square.containsPoint(1, 1)).toBe(true);
    });

    it('returns false for a point given outside of the square\'s perimeter', () => {
      let square = new Square(2);
      expect(square.containsPoint(10, 6)).toBe(false);
      expect(square.containsPoint(2, 0)).toBe(false);
    });
  });
});
