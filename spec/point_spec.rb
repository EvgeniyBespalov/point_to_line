require_relative '../point.rb'

describe Point do

  before :all do
    @point = Point.new 'A', 1, 2
  end
  
  it 'valid name' do
    expect(@point.name).to eql 'A'
  end

  it 'valid x' do
    expect(@point.x).to eql 1
  end

  it 'valid y' do
    expect(@point.y).to eql 2
  end

end
