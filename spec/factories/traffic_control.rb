FactoryBot.define do
  factory :traffic_control do
    weather { weather_report }
    initialize_with { new(weather) }
  end
end
