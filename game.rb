require './lib/trainer'
require './lib/pokemon'
require 'yaml'

class Game
  attr_reader :pokedex, :trainer
  attr_writer :trainer

  def initialize
    File.open("./pokedex.yaml", "r") do |file|
      @pokedex = YAML::load(file)
    end
    @trainer = Trainer.new
  end

  def run
    run_intro
    starter_pokemon_message
    get_starter_pokemon
    bonus_pokemon
    puts mulligan_message
    mulligan
  end

  def run_intro
    File.open('intro.txt') do |file|
      file.each do |line|
        puts line
        sleep(1)
      end
    end

    trainer.name = get_name

    puts "\n#{trainer.name}! Your very own POKéMON legend is about to unfold!"
    sleep(1)
    puts "A world of dreams and adventures with POKéMON awaits!"
    sleep(1)
    puts "Let’s go!"
  end

  def get_name
    get_input.capitalize
  end

  def get_input
    gets.chomp.downcase
  end

  def starter_pokemon_message
    puts "\nI will give you one Pokemon to start out your journey with.\n"
    sleep(1)
    puts "Do you want the grass Pokemon, Bulbasaur?"
    sleep(1)
    puts "Do you want the water Pokemon, Squirtle?"
    sleep(1)
    puts "Or do you want the fire Pokemon, Charmander?"
  end

  def get_starter_pokemon
    desired = get_input

    if /bulbasaur|squirtle|charmander/.match(desired)
      trainer.my_pokemon << pokemon_lookup(desired)
    else
      puts "Sorry, you can't have that Pokemon."
      get_starter_pokemon
    end
  end

  def pokemon_lookup(desired)
    pokedex.each do |pokemon|
      return pokemon if pokemon.name.downcase == desired
    end
  end

  def bonus_pokemon
    puts "\nI'll now give you some bonus Pokemon!"
    sleep(2)
    puts "\nHere are your Pokemon!"
    5.times do
      pokemon = pokedex.sample
      puts "#{pokemon.name} (#{pokemon.type})"
      trainer.my_pokemon << pokemon
      sleep(1)
    end
  end

  def mulligan_message
    "\nIf you do not like the Pokemon you were given, print 'redo' to get a new set. This will only work once! \nIf you are happy with your set, print c to cancel."
  end

  def mulligan
    case get_input
    when 'redo'
      puts "\nOkay."
      trainer.my_pokemon = [trainer.my_pokemon[0]]
      bonus_pokemon
    when 'c'
      puts "Good!"
    else
      puts "Please type redo or c."
      mulligan
    end

    puts "\nHere are all your Pokemon!"
    trainer.my_pokemon.each {|pokemon| puts "#{pokemon.name} (#{pokemon.type})"}
  end
end

Game.new.run