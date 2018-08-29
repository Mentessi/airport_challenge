class TrafficControl

  attr_reader :weather

  def initialize(weather_report)
    @weather = weather_report
  end

  def instruct_to_land(plane, airport)
    raise 'Permission denied' unless permission_to_land?(plane, airport)
    plane.land airport
    airport.park_plane plane
  end

  def instruct_to_take_off(plane, airport)
    raise 'Permission denied' unless permission_to_take_off?(plane, airport)
    plane.take_off
    airport.clear_parking_space plane
  end

  private

  def permission_to_land?(plane, airport)
    weather.sunny? && airport.parking_available? && plane.location == :in_air
  end

  def permission_to_take_off?(plane, airport)
    weather.sunny? && airport.parked_planes.include?(plane)
  end
end
