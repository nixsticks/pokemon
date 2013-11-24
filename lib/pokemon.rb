class Pokemon
  attr_reader :name, :type, :learnset

  def initialize(name, type, learnset, base_stats)
    @name = name
    @type = type
    @learnset = learnset
    base_stats.each { |stat, value| instance_variable_set("@#{stat}", value) }
  end

  def say_name
    "I am #{name}! ROAR"
  end
end