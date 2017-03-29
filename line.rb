class Line
  
  attr_accessor :point_a, :point_b, :angle, :b, :verticale
  
  def initialize(point_a, point_b, angle, b, verticale)
    @point_a = point_a
    @point_b = point_b
    @angle = angle
    @b = b
  end

end