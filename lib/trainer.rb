class Trainer
  attr_accessor :my_pokemon, :name

  def initialize
    @my_pokemon = []
  end

  def catch(pokemon)
    my_pokemon << pokemon
  end
end