class Horsea < Pokemon
  attr_accessor :type, :level, :hp, :exp, :attack, :defense, :speed, :moves

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

  def move
    moves.sample
  end

  def level_up
    @level += 1 if exp > level**3
    puts "Oh yeah! Leveled up"
  end

  def gain_exp new_exp
    @exp += new_exp
  end
  
  def learn(move)
    @moves << move if LEARNSET.include?(move) && level >= LEARNSET[move]
  end
end