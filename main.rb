require_relative "search_line.rb"



#arg = ['A,0,3', 'B,1,2', 'C,2,1', 'D,3,0', 'E,2,2', 'G,3,3', 'H,2,4', 'I,4,2', 'J,5,1', 'L,0,5']#, 'F,3,2' 'K,4,4', 
arg = ['A,1,1', 'B,2,2', 'C,3,3', 'D,4,4', 'E,2,4', 'G,2,6', 'H,3,1', 'J,3,5', 'K,5,5', 'L,6,2'] 
a = SearchLine.new
a.search(arg)

print "\n"

