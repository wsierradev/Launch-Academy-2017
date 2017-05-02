class Square {
  constructor(length, x=0, y=0) {
  this.length = length;
  this.x = x;
  this.y = y;
  }

  area () {
    return Math.pow(this.length, 2);
  }

  perimeter() {
    return this.length * 4;
  }

  containsPoint(x,y) {
    let point = this.length / 2;

    if(((this.x - point <= x) && (x <= this.x + point)) &&
      ((this.y - point <= y) && (y <= this.y + point))) {
        return true;
        }
        return false;
        }
}
