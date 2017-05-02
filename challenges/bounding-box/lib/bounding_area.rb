class BoundingArea

  def initialize(boxes)
    @boxes = boxes
  end

  def boxes_contain_point?(x,y)
    counter = 0
    @boxes.each do |box|
   if @boxes.contains_point?(x,y)
     return true
   else
   counter += 1
    return false
   end
    end
  end

end
