class Circle {
  constructor(radius, x=0, y=0) {
    this.radius = radius;
    this.x = x;
    this.y = y;
  }

  diameter() {
    return this.radius * 2;
  }

  area() {
    return Math.PI * Math.pow(this.radius, 2);
  }

  perimeter() {
    return 2 * Math.PI * this.radius;
  }
};
