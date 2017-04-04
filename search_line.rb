require_relative 'point.rb'
require_relative 'line.rb'

class SearchLine

  #search line from three or more point
  def search(points)
  
    point_array = get_point(points)
    
    line_array = create_all_line point_array
    
    return get_valid_point line_array
    
  end
  
  #заполняем массив точек данными из входного массива
  def get_point(points)
    
    point_array = []
    
    points.each do |element|
      temp_array = element.split ','
      point_array.push(Point.new temp_array[0], temp_array[1].to_i, temp_array[2].to_i)
    end   
    
    return point_array
    
  end
  
  #создаем все допустимые линии
  def create_all_line(point_array)
  
    line_array = []
     
    point_array.each do |point_a|
      point_array.select{|x| x != point_a}.each do |point_b|
        if ((line_array.select{|l| l.point_a == point_a && l.point_b == point_b}).length == 0 &&
          (line_array.select{|l| l.point_a == point_b && l.point_b == point_a}).length == 0)
            line_array.push(Line.new(point_a, point_b))
        end
      end
    end
    
    return line_array
    
  end
  
    #выбираем точки из линий в которых смещение и угол совпадают, с количеством линий больше 1
  def get_valid_point(line_array)

    points_result = []    
    lines_result = []
    
    line_array.uniq{ |x| [x.angle, x.b, x.verticale] }.each do |angle|
      if line_array.select {|l| (l.angle == angle.angle && l.b == angle.b && l.verticale == angle.verticale) }.count > 1
        points_result.clear       
                
        for line in line_array.select {|l| l.angle == angle.angle && l.b == angle.b && l.verticale == angle.verticale}
            points_result.push(line.point_a)
            points_result.push(line.point_b)
        end
        
        points_result = points_result.uniq
        lines_result.push(points_result.sort_by{ |p| p.name })

      end   
    end
    
    return lines_result
      
  end
  
end