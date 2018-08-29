require 'spec_helper'

RSpec.describe 'Airport' do

  let!(:airport) { FactoryBot.build :airport }
  let!(:plane1) { FactoryBot.build :plane }
  let!(:plane2) { FactoryBot.build :plane }

  it 'gives plane parking availability' do
    expect(airport.parking_available?).to be_truthy
  end

  it 'records parked planes in parking bays' do
    airport.park_plane(plane1)
    expect(airport.parked_planes).to include(plane1)
  end

  it 'makes space available after a plane has taken off' do
    airport.park_plane(plane1)
    expect(airport.parked_planes).to include(plane1)
    airport.clear_parking_space(plane1)
    expect(airport.parked_planes).not_to include(plane1)
  end

  it 'will not allow a plane to park if there are no spaces' do
    airport.park_plane(plane1)
    expect(airport.parking_available?).to be_falsey
    expect { airport.park_plane(plane2) }.to raise_error 'no spaces'
  end
end
