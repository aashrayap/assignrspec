require 'start'

describe Warmup do

	let (:w){Warmup.new}

	describe '#gets_shout' do 

		it 'gets input and upcases' do
		  allow(w).to receive(:gets).and_return('ash')

		  expect(w.gets_shout).to eq('ASH')
		end
	end

	describe '#triple_size' do 

		it 'multiplies array by 3' do
		  fake_array = double(:size => 3)

		  expect(w.triple_size(fake_array)).to eq(9)
		end
	end
end

