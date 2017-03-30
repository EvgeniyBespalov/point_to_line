class Point
  
  attr_accessor :name, :x, :y
  
  def initialize(name, x, y)
    @name = name
    @x = x
    @y = y
  end
  
  def to_s
    return "\"" + @name + "," + @x.to_s + "," + @y.to_s + "\""
  end

end