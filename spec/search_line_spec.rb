require_relative '../search_line.rb'

describe SearchLine do

  before :all do
    @search_line = SearchLine.new
  end
  
  context '.search' do
    it 'search validate' do
      points = ['A,1,1', 'B,2,2', 'C,3,3', 'D,4,4', 'E,2,4', 'G,2,6', 'H,3,1', 'J,3,5', 'K,5,5', 'L,6,2']
      
      expect(@search_line.search(points)).to eql (["ABCDK", "BEG", "CHJ", "DGJL"])
    end
  end

end