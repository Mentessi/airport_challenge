class WeatherReport
  SUNNY = :sunny
  STORMY = :stormy

  def current_weather
    rand(100) < 95 ? SUNNY : STORMY
  end

  def sunny?
    current_weather == SUNNY
  end
end
