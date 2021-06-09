class Station 
  attr_reader :name, :zone
  def initialize(name = "Bond", zone = 4 )
    @name = name
    @zone = zone
  end 
end 