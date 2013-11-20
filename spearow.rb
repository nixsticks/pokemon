class Spearow
  attr_accessor :type, :level, :hp, :exp, :attack, :defense, :speed, :moves

  TYPE = ["normal", "flying"]
  LEARNSET = {
      "Peck" => 0,
      "Growl" => 0,
      "Leer" => 5,
      "Fury Attack" => 9,
      "Pursuit" => 13,
      "Aerial Ace" => 17,
      "Mirror Move" => 21,
      "Agility" => 25,
      "Assurance" => 29,
      "Roost" => 33,
      "Drill Peck" => 37
    }

  def initialize
    @type = "Spearow"
    @hp = 40
    @exp = 0
    @attack = 60
    @defense = 30
    @speed = 70
    @level = 0
    @moves = ["Peck", "Growl"]
  end

  def evolve
    @type = "Fearow" if level > 19
  end

  def move
    moves.sample
  end

  def level_up
    @level += 1 if exp > @level**3
    puts "Oh yeah! Leveled up"
  end

  def gain_exp new_exp
    @exp += new_exp
  end
  
  def learn(move)
    @moves << move if LEARNSET.include?(move) && @level >= LEARNSET[move]
  end
end