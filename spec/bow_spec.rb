require 'weps/bow'

describe Bow do

	let(:b){Bow.new}

	describe '#initialize' do

	  it 'arrow count is readable' do
	  	expect{b.arrows}.to_not raise_error
	  end

	  it 'starts with 10 arrows by default' do
	    expect(b.arrows).to eq(10)
	  end
	  it 'starts with specified number of arrows' do
	  	expect(Bow.new(20).arrows).to eq(20)
	  end
	end

	describe '#use' do
	  it 'gives error if using a bow with no arrows' do
	  	bow=Bow.new(0)
	    expect{bow.use}.to raise_error
	  end
	end
end

