require './lib/scraper'
require './lib/pokemon'
require 'yaml'

module PokemonFactory
  def get_pokemon
    scraper = Scraper.new("http://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number")
    pokemon = scraper.get_urls

    pokedex = []

    # pokemon.each do |url|
    #   scrape = Scraper.new(url)
    #   name = scrape.get_name
    #   type = scrape.get_type
    #   learnset = scrape.get_learnset
    #   base_stats = scrape.get_base_stats
    #   pokedex << Pokemon.new(name, type, learnset, base_stats)
    # end

    pokemon.each do |url|
      scrape = Scraper.new(url)
      name = scrape.get_name
      type = scrape.get_type
      learnset = scrape.get_learnset
      base_stats = scrape.get_base_stats
      pokedex << Pokemon.new(name, type, learnset, base_stats)
    end

    File.open("pokedex.yaml", "w") do |file|
      file.puts YAML::dump(pokedex)
    end
  end

  # def get_pokemon
  #   scraper = Scraper.new("http://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number")
  #   pokemon = scraper.get_urls

  #   File.open("pokedex2.yaml", "w") do |file|
  #     pokemon.each do |url|
  #       scrape = Scraper.new(url)
  #       name = scrape.get_name
  #       type = scrape.get_type
  #       learnset = scrape.get_learnset
  #       base_stats = scrape.get_base_stats
  #       file.puts Pokemon.new(name, type, learnset, base_stats).to_yaml
  #     end
  #   end
  # end
end