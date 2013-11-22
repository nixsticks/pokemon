require 'nokogiri'
require 'open-uri'
require 'awesome_print'

class Scraper
  attr_reader :html

  def initialize(url)
    @html = Nokogiri::HTML(open(url))
  end

  def get_pokemon_names
    names = html.xpath('//a[contains(@title, "(Pokémon)")]').text.split(/(?<=[a-z.♂♀é])(?=[A-Z])/)
    names.uniq!
  end

end

scraper = Scraper.new("http://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number")
ap scraper.get_pokemon_names