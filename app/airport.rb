class Airport

  attr_accessor :parked_planes
  attr_reader :parking_spaces, :location

  def initialize(location, parking_spaces = 10)
    @location = location
    @parking_spaces = parking_spaces
    @parked_planes = []
  end

  def parking_available?
    parked_planes.length < parking_spaces
  end

  def park_plane(plane)
    raise 'no spaces' unless parking_available?
    parked_planes << plane
  end

  def clear_parking_space(plane)
    parked_planes.delete(plane)
  end
end
