require 'buddy'

describe Viking do
	let(:v){Viking.new}
	let(:axe){Axe.new}

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
	end

	describe '#pick_up_weapon' do
		it  'picking up sets weapon' do
		  v.pick_up_weapon(axe)
		  expect(v.weapon).to_not be_nil
		end
	end

	describe '#drop_weapon' do
		it 'drops weapon' do
		  v.drop_weapon
		  expect(v.weapon).to be_nil
		end
	end

	describe '#receive_attack' do
		it 'causes viking to take specified damage dealt' do
		  allow(v.receive_attack(20)).to receive(:take_damage).and_return(50)
		  expect(v.health).to eq(80)
		end
	end
end
