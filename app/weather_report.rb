module WeatherReport
  def current_weather
    rand(100) < 95 ? 'sunny' : 'stormy'
  end
end
