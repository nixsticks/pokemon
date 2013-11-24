require 'awesome_print'
require './lib/scraper'
require './lib/pokemon'
require 'ruby-debug'

module GetPokemon
  def get_pokemon
    scraper = Scraper.new("http://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number")
    pokemon = scraper.get_pokemon_urls

    pokedex = []

    pokemon.each do |url|
      scrape = Scraper.new(url)
      name = scrape.get_name
      type = scrape.get_type
      learnset = scrape.get_learnset
      base_stats = scrape.get_base_stats
      pokedex << Pokemon.new(name, type, learnset, base_stats)
    end
    
    pokedex
  end
end


# file = File.open( "#{name}.rb", "w" )
# file << "class #{name}\n\nend"
# file.close  

class App
  include GetPokemon
  attr_reader :pokedex

  def initialize
    @pokedex = get_pokemon
  end

  def lookup(name_given, attribute)
    pokedex.each do |pokemon|
      pokemon.attribute if pokemon.name == name_given
    end
  end
end

app = App.new
puts app.lookup("Bulbasaur", "learnset")