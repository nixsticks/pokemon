require 'nokogiri'
require 'open-uri'
require 'awesome_print'

class Scraper
  attr_reader :html

  def initialize(url)
    @html = Nokogiri::HTML(open(url))
    @urls = []
  end

  # def get_pokemon_names
  #   names = html.xpath('//a[contains(@title, "(Pokémon)")]').text.split(/(?<=[a-z.♂♀é2])(?=[A-Z])/)
  #   names.uniq!
  # end

  def get_pokemon_urls
    pokemons = html.xpath('//a[contains(@title, "(Pokémon)")]').map { |link| link['href'] }
    urls = pokemons.map {|url| url = "http://bulbapedia.bulbagarden.net" + url}
  end

  def get_pokemon_name
    html.search('.firstHeading').text.gsub(" (Pokémon)", "")
  end

  def get_pokemon_learnset
    html.search('//table[16]//a[contains(@title, "(move)")]/span').map {|move| move.text}
  end

  def get_pokemon_base_stats
    html.search('//a[contains(@title, "Stats")]/span').text
  end
end

scraper = Scraper.new("http://bulbapedia.bulbagarden.net/wiki/Bulbasaur_(Pok%C3%A9mon)")
ap scraper.get_pokemon_learnset