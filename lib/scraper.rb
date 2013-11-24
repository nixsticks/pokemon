require 'nokogiri'
require 'open-uri'
require 'awesome_print'

class Scraper
  attr_reader :html

  def initialize(url)
    @html = Nokogiri::HTML(open(url))
    @urls = []
  end

  def get_pokemon_urls
    pokemons = html.xpath('//a[contains(@title, "(Pokémon)")]').map { |link| link['href'] }
    urls = pokemons.map {|url| url = "http://bulbapedia.bulbagarden.net" + url}
  end

  def get_name
    html.search('.firstHeading').text.gsub(" (Pokémon)", "")
  end

  # def get_pokemon_learnset
  #   html.search('//table[16]//a[contains(@title, "(move)")]/span').map {|move| move.text}
  # end

  def get_learnset
    html.search('//h3[contains(span, "Learnset")]/following::table//a[contains(@title, "(move)")]/span[following::span[contains(@id, "By_TM.2FHM")]]').map {|move| move.text}
  end

  def get_base_stats
    stats = html.search('//a[contains(@title, "Stats")]/span').map{|stat| stat.text == "Stat" ? next : stat.text}.compact
    stats.map! {|stat| stat.gsub(".", "_")}
    values = html.search('//h4[contains(span, "Base stats")]/following::tr/th[contains(@style, "30")][following::th[contains(text(), "Total:")]]').map{|number| number.text.chomp}
    base_stats = {}
    size = stats.size

    size.times do |i|
      base_stats[stats[i].downcase] = values[i].to_i
    end

    base_stats
  end

  def get_type
    html.search('//a[contains(@title, "(type)")]/span')[0].text
  end
end