require 'ruby-debug'

class Pokemon
  attr_reader :name, :type, :learnset

  def initialize(name, type, learnset, base_stats)
    @name = name
    @type = type
    @learnset = learnset
    base_stats.each { |stat, value| instance_variable_set("@#{stat}", value) }
    
    instance_variables.each do |variable|
      var = variable.to_s.gsub("@", "")
      self.class.send(:attr_accessor, var)
    end
  end

  def say_name
    "I am #{name}! ROAR"
  end
end