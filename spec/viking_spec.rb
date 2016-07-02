require 'buddy'

describe Viking do
	let(:v){Viking.new}
	let(:hotshot){Viking.new}
	let(:axe){Axe.new}
	let(:bow){Bow.new}

	describe '#initialize' do
		it 'sets a name attribute' do
		  expect(Viking.new('buddy').name).to eq('buddy')
		end
		it 'sets a health attribute' do
		  expect(Viking.new('buddy',20).health).to eq(20)
		end
		 it 'doesnt allow health to be changed' do
		   expect{v.health=20}.to raise_error(NoMethodError)
		end

		it 'creates nil weapon by default' do
		  expect(v.weapon).to eq(nil)
		end
	end

	describe '#pick_up_weapon' do
		it  'picking up sets weapon' do
		  v.pick_up_weapon(axe)
		  expect(v.weapon).to_not be_nil
		end

		it 'picking up non weapon raises exception' do
		  expect do
		  	v.pick_up_weapon(Viking.new)
		  end.to raise_exception
		end

		it 'replaces existing weapon' do
			v.pick_up_weapon(axe)
			v.pick_up_weapon(bow)
			expect(v.weapon).to eq(bow)
		end
	end

	describe '#drop_weapon' do
		it 'drops weapon' do
		  v.drop_weapon
		  expect(v.weapon).to be_nil
		end
	end

	describe '#take_damage' do
		it 'causes viking to take specified damage dealt' do
		  v.receive_attack(20)
		  expect(v.health).to eq(80)
		end
		it 'take damage method is called' do
		  expect(v).to receive(:take_damage)
		  v.receive_attack(20)
		end
		it 'causes vikings health to drop' do
		  initial_health=hotshot.health
		  v.attack(hotshot)
		  expect(hotshot.health).to be < initial_health
		end
		it 'calls attacked vikings take_damage method' do
		  expect(hotshot).to receive(:take_damage)
		  v.attack(hotshot)
		end
		it 'attacking with no weapon causes fist use' do
		  expect(hotshot).to receive(:damage_with_fists)
		  hotshot.attack(v)
		end

	end

end



