class Plane

  attr_accessor :location

  def initialize(location)
    @location = location
  end

  def land(airport)
    self.location = airport.location
  end

  def take_off
    self.location = 'in air'
  end
end
