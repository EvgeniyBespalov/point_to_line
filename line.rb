class Line
  
  attr_accessor :point_a, :point_b, :angle, :b, :verticale
  
  def initialize(point_a, point_b)
    @point_a = point_a
    @point_b = point_b
    
    verticale = @point_a.x == @point_b.x
  
    if verticale
      @b = @point_a.x
    else
      @angle = (@point_a.y.to_f - @point_b.y.to_f)/(@point_a.x.to_f - @point_b.x.to_f)
      @b = @point_a.y.to_f - @point_a.x.to_f * @angle.to_f
    end    
    
  end

end