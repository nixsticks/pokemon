require 'awesome_print'
require './scraper'

scraper = Scraper.new("http://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number")
pokemon = scraper.get_pokemon_urls

pokemon.each do |url|
  scrape = Scraper.new(url)
  name = scrape.get_pokemon_name
  file = File.open( "#{name}.rb", "w" )
  file << "class #{name}\n\nend"
  file.close  
end