require 'awesome_print'
require './lib/scraper'
require './lib/pokemon'
require 'yaml'
require 'ruby-debug'

class Pokedex
  attr_reader :pokedex
  
  def initialize
    File.open("./test.yaml", "r") do |file|
      @pokedex = YAML::load(file)
    end
  end

  def welcome
    "Welcome to the Pokédex!"
  end

  def lookup_message
    "\nType in the name of a Pokémon to get its information. Print e to exit at any time."
  end

  def get_input
    gets.chomp.downcase
  end

  def lookup
    entry = get_input

    exit if /^e(xit)?$/.match(entry)

    pokedex.each do |pokemon|
      return pokemon if pokemon.name.downcase == entry
    end

    puts "\nSorry, that Pokémon does not exist in our database. Please try again."
    lookup
  end

  def print_information(pokemon)
    puts
    # pokemon.instance_variables.each do |variable|
    # #   var_name = variable.to_s.gsub("@","")
    #   result = pokemon.send("#{var_name}")
    #   debugger
    #   if result.is_a?(Array)
    #     puts var_name.capitalize
    #     ap result
    #   else
    #     puts var_name.capitalize + ": " + result
    #   end
    # end
    puts "Name: #{pokemon.name}"
    puts "Type: #{pokemon.type}"
    puts "Learnset:"
    ap pokemon.learnset
  end

  def another_pokemon_message
    "\nLook up another entry?"
  end


  def run
    puts welcome
    puts lookup_message
    loop do
      print_information(lookup)
      puts another_pokemon_message
    end
  end
end

pokedex = Pokedex.new
pokedex.run