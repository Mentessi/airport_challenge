require 'spec_helper'

RSpec.describe 'weather report' do

  let!(:weather) { FactoryBot.build :weather_report }

  it 'describes the weather' do
    expect(weather.class).to eq(WeatherReport)
    expect(weather.current_weather).to_not be nil
    expect(weather.current_weather).to eq(:sunny).or eq(:stormy)
  end
end
