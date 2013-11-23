class Pokemon
  attr_reader :name, :learnset

  def initialize(name, learnset)
    @name = name
    @learnset = learnset
  end

  def say_name
    "I am #{name}! ROAR"
  end
end