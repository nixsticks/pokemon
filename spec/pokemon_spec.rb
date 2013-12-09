require '../lib/pokemon'

describe Pokemon do
  let(:pokemon) {Pokemon.new("Jigglypuff")}

  describe '#initialize' do
    it 'should initialize the Pokemon with its name' do
      expect(pokemon.name).to eq("Jigglypuff")
    end

    it 'should allow each separate class of Pokemon to have a learnset' do
      
    end
  end

  describe '#say_name' do
    it 'should say its name' do
      expect(pokemon.say_name).to eq('I am Jigglypuff! ROAR')
    end
  end
end