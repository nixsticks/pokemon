class Pokemon
  attr_reader :name, :type, :learnset

  def initialize(name, type, learnset, base_stats)
    @name = name
    @type = type
    @learnset = learnset
    base_stats.each { |stat, value| instance_variable_set("@#{stat}", value) }
  end

  def post_deserialize
    instance_variables.each do |variable|
      var = variable.to_s.gsub("@", "")
      puts "HELLO"
      self.class.send(:attr_accessor, var)
    end
  end
end