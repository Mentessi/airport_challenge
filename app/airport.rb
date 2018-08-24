class Airport

  attr_accessor :parking_bays
  attr_reader :parking_spaces, :location

  def initialize(location, parking_spaces = 10)
    @location = location
    @parking_spaces = parking_spaces
    @parking_bays = []
  end

  def parking_available?
    parking_bays.length < parking_spaces
  end

  def park_plane(plane)
    raise 'no spaces' if parking_available? == false
    parking_bays << plane
  end

  def clear_parking_space(plane)
    parking_bays.delete(plane)
  end
end
