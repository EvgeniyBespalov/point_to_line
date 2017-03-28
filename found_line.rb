require_relative 'point.rb'
require_relative 'line.rb'

class FoundLine

  def found(point_array)
  
    #массив входных точек
    @array_point = Array.new
    
    #массив всех допустимых линий
    @line_list = Array.new
    
    #массив всех допустимых линий
    @line_list_few = Array.new
    
    #массив результирующих точек
    @points_result = Array.new
    
    #массив результирующих линий
    @lines_result = Array.new
    
        
    
    #заполняем массив точек данными из входного массива
    for element in point_array
      temp_array = element.split ','
      @array_point.push Point.new temp_array[0], temp_array[1].to_i, temp_array[2].to_i
    end
    
    #создаем все допустимые линии
    for pointA in @array_point
      for pointB in @array_point.select {|x| x != pointA}
        if ((@line_list.select {|l| l.pointA == pointA && l.pointB == pointB}).length == 0 &&
          (@line_list.select {|l| l.pointA == pointB && l.pointB == pointA}).length == 0)
            @line_list.push Line.new pointA, pointB, 0, 0
        end     
      end
    end
    
    #рассчитываем угол наклона линий    
    for line in @line_list
        if (line.pointA.x == line.pointB.x)
          line.angile = 999999
        else
          line.angile = (line.pointA.y - line.pointB.y - 0.0)/(line.pointA.x - line.pointB.x - 0.0)
        end
    end  	 	
    
    #рассчитываем смещение линии    
    for line in @line_list
        if (line.angile == 999999)
          line.b = line.pointA.x
        else
          line.angile = (line.pointA.y - line.pointB.y - 0.0)/(line.pointA.x - line.pointB.x - 0.0)
        end
       line.b = line.pointA.y - line.pointA.x * line.angile
       
       
        print line.pointA.name + " " + line.pointB.name + " " + line.angile.to_s + " " + line.b.to_s
        print "\n"   
    end  	 	
    
       
    
    #выбираем точки из линий в которых смещение и угол совпадают, с количеством линий больше 1
    for angile in @line_list.uniq{ |x| [x.angile, x.b] }
      
      if @line_list.select {|l| l.angile == angile.angile && l.b == angile.b }.count > 1
        
        @points_result.clear       
                
        for line in @line_list.select {|l| l.angile == angile.angile && l.b == angile.b }
            
            @points_result.push(line.pointA)
            @points_result.push(line.pointB)
        end
        
        @points_result = @points_result.uniq{ |p| p }
            
        @lines_result.push(@points_result.sort_by{ |p| :name })

      end   
    end  
    
    for lines in @lines_result
      print lines
      print "\n"   
    end      
    
  end

end