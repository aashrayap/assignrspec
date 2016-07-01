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

	describe '#calls_some_methods' do 
		let (:string){'hello'}

		it 'calls upcase on a string' do 
	 	 expect(string).to receive(:upcase!).and_return(string.upcase)
	  	 w.calls_some_methods(string)
	  	end

	  	it 'reverse passed string' do
	  		expect(string).to receive(:reverse!).and_return(string.reverse)
	  		w.calls_some_methods(string)
	  	end

	  	it 'returns an unrelated string' do
	  	  expect(w.calls_some_methods(string)).to_not eq('OLLEH')
	  	end
	 end
end

