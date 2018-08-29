
class TrafficControl

  attr_reader :weather

  def initialize(weather_report)
    @weather = weather_report
  end

  def instruct_to_land(plane, airport)
    raise 'Permission denied' if permission_to_land?(plane, airport) == false
    plane.land airport
    airport.park_plane plane
  end

  def instruct_to_take_off(plane, airport)
    raise 'Permission denied' if permission_to_take_off?(plane, airport) == false
    plane.take_off
    airport.clear_parking_space plane
  end

  private

  def permission_to_land?(plane, airport)
    sunny? && airport.parking_available? && plane.location == 'in air'
  end

  def permission_to_take_off?(plane, airport)
    sunny? && airport.parking_bays.include?(plane)
  end

  end
end
