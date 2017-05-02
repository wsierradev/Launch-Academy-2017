class BoundingBox
attr_accessor :width, :height, :left, :right, :top, :bottom


  def initialize(x, y, width, height)
    @x = x
    @y = y
    @width = width
    @height = height
  end

  def width
    @width
  end

  def height
    @height
  end

  def left
    @x
  end

  def right
    @x + @width
  end

  def top
    @y + @height
  end

  def bottom
    @y
  end

  def contains_point?(x1, y1)
    if x1 <= right && y1 <= top && x1 >= left && y1 >= bottom
    return true
  else
    false
  end
end
end
