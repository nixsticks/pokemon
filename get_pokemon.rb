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

    File.open("pokedex.yaml", "w") do |file|
      file.puts YAML::dump(pokedex)
    end
  end
end

get_pokemon