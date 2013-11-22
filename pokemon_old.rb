class Pokemon
  attr_accessor :type, :level, :hp, :exp, :attack, :defense, :speed, :moves

  def move
    moves.sample
  end

  def level_up
    level += 1 if exp > @level**3
    puts "Oh yeah! Leveled up"
  end

  def gain_exp new_exp
    exp += new_exp
  end
  
  def learn(move)
    moves << move if LEARNSET.include?(move) && level >= LEARNSET[move]
    puts "Learned #{move}!"
  end
end

class Squirtle < Pokemon

  TYPE = ["water"]
  LEARNSET = {
    "Tackle" => 0,
    "Tail Whip" => 4,
    "Water Gun" => 7,
    "Withdraw" => 10,
    "Bubble" => 13,
    "Bite" => 16,
    "Rapid Spin" => 19,
    "Protect" => 22,
    "Water Pulse" => 25,
    "Aqua Tail" => 28,
    "Skull Bash" => 31,
    "Iron Defense" => 34,
    "Rain Dance" => 37,
    "Hydro Pump" => 40
  }

  def initialize
    @type = "Squirtle"
    @hp = 44
    @attack = 48
    @defense = 65
    @speed = 43
    @level = 0
    @abilities = ["Tackle"]
  end

  def evolve
    if level > 15
      type = "Wartortle"
    elsif level > 35
      type = "Blastoise"
    end
  end
end

class Spearow < Pokemon

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
    type = "Fearow" if level > 19
  end
end

class Horsea < Pokemon

  TYPE = ["water"]
  LEARNSET = {
    "Bubble" => 0,
    "SmokeScreen" => 4,
    "Leer" => 8,
    "Water Gun" => 11,
    "Focus Energy" => 14,
    "BubbleBeam" => 18,
    "Agility" => 23,
    "Twister" => 26,
    "Brine" => 30,
    "Hydro Pump" => 35,
    "Dragon Dance" => 38,
    "Dragon Pulse" => 42
  }

  def initialize
    @type = "Horsea"
    @hp = 30
    @exp = 0
    @attack = 40
    @defense = 70
    @speed = 60
    @level = 0
    @moves = ["Bubble"]
  end

  def evolve
    type = "Seadra" if level > 31
  end
end