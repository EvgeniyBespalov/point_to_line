require_relative 'point.rb'
require_relative 'line.rb'

class SearchLine

  def search(point_array)
  
    #массив входных точек
    @array_point = []
    
    #массив всех допустимых линий
    @line_list = []
    
    #массив результирующих точек
    @points_result = []
    
    #массив результирующих линий
    @lines_result = []         
    
    #заполняем массив точек данными из входного массива
    point_array.each do |element|
      temp_array = element.split ','
      @array_point.push(Point.new temp_array[0], temp_array[1].to_i, temp_array[2].to_i)
    end    
    
    #создаем все допустимые линии
    @array_point.each do |point_a|
      @array_point.select{|x| x != point_a}.each do |point_b|
        if ((@line_list.select{|l| l.point_a == point_a && l.point_b == point_b}).length == 0 &&
          (@line_list.select{|l| l.point_a == point_b && l.point_b == point_a}).length == 0)
            @line_list.push(Line.new point_a, point_b, 0, 0, false)
        end     
      end
    end
    
    #рассчитываем угол наклона линий    
     @line_list.each do |line|
       if (line.point_a.x == line.point_b.x)
         line.verticale = true
       else
         line.angle = (line.point_a.y.to_f - line.point_b.y.to_f)/(line.point_a.x.to_f - line.point_b.x.to_f)
       end
    end  	 	
    
    #рассчитываем смещение линии    
    @line_list.each do |line|
       if line.verticale
         line.b = line.point_a.x
       else
         line.b = line.point_a.y - line.point_a.x * line.angle
       end
    end       
    
    #выбираем точки из линий в которых смещение и угол совпадают, с количеством линий больше 1
    @line_list.uniq{ |x| [x.angle, x.b, x.verticale] }.each do |angle|
      if @line_list.select {|l| (l.angle == angle.angle && l.b == angle.b && l.verticale == angle.verticale) }.count > 1
        @points_result.clear       
                
        for line in @line_list.select {|l| l.angle == angle.angle && l.b == angle.b && l.verticale == angle.verticale}
            @points_result.push(line.point_a)
            @points_result.push(line.point_b)
        end
        
        @points_result = @points_result.uniq{ |p| p }
        @lines_result.push(@points_result.sort_by{ |p| :name })

      end   
    end  
    
    @lines_result.each do |lines|
      print "["
      lines.each do |point| 
        print point.name + "," + point.x.to_s + "," + point.y.to_s + " "
      end
      puts "]"
    end      
    
  end

end