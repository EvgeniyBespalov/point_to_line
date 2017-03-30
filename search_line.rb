require_relative 'point.rb'
require_relative 'line.rb'

class SearchLine

  def search(point_array)
  
    init_variable
    
    get_point point_array
    
    create_all_line
    
    get_valid_point
    
    print_result
    
  end
  
  #инициализация переменных
  def init_variable
    
    #массив входных точек
    @array_point = []
    
    #массив всех допустимых линий
    @line_list = []
    
    #массив результирующих точек
    @points_result = []
    
    #массив результирующих линий
    @lines_result = []         
      
  end
  
  #заполняем массив точек данными из входного массива
  def get_point point_array
      
    point_array.each do |element|
      temp_array = element.split ','
      @array_point.push(Point.new temp_array[0], temp_array[1].to_i, temp_array[2].to_i)
    end   
    
  end
  
  #создаем все допустимые линии
  def create_all_line
    @array_point.each do |point_a|
      @array_point.select{|x| x != point_a}.each do |point_b|
        if ((@line_list.select{|l| l.point_a == point_a && l.point_b == point_b}).length == 0 &&
          (@line_list.select{|l| l.point_a == point_b && l.point_b == point_a}).length == 0)
            @line_list.push(Line.new(point_a, point_b))
        end
      end
    end
  end
  
    #выбираем точки из линий в которых смещение и угол совпадают, с количеством линий больше 1
  def get_valid_point
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
  end
  
  #выводим результат
  def print_result
    @lines_result.each do |lines|
      print "["
      lines.each do |point| 
        print point.name + "," + point.x.to_s + "," + point.y.to_s + " "
      end
      puts "]"
    end  
  end

end