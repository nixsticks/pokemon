class Squirtle
  attr_accessor :type, :level, :hp, :attack, :defense, :speed, :moves

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