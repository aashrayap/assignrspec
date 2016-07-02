require 'buddy'

describe Viking do
	let(:v){Viking.new}

	describe '#initialize' do
		it 'sets a name attribute' do
		  expect(Viking.new('buddy').name).to eq('buddy')
		end
		it 'sets a health attribute' do
		  expect(Viking.new('buddy',20).health).to eq(20)
		end
		# it 'doesnt allow health to be changed'
		it 'creates nil weapon by default' do
		  expect(v.weapon).to eq(nil)
		end
		it  'picking up sets weapon'
		  expect(v.pick_up_weapon)
	end
end
