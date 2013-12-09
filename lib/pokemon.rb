class Pokemon
  attr_reader :type, :learnset, :moves
  attr_writer :level, :moves, :evolution

  def initialize(type, learnset, base_stats)
    @type = type
    @level = 3
    @learnset = learnset
    @moves = []
    @evolution
    learnset.each {|move, req_level| @moves << move if @level >= req_level}
    base_stats.each { |stat, value| instance_variable_set("@#{stat}", value) }
  end

  def level_up(new_level)
    level = new_level
    puts "#{name} grew to level #{level}!"
  end

  def learn(move)
    moves << move if learnset.keys.include?(move) && learnset[move] <= level
    puts "#{name} learned #{move}!"
  end

  def attack(move)
    if moves.include?(move)
      puts "#{name} used #{move}!"
    else
      puts "#{name} does not know that move."
    end
  end
end