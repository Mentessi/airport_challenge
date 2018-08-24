require 'spec_helper'

RSpec.describe 'Plane' do

  let!(:plane) { FactoryBot.build :plane }
  let!(:airport) { FactoryBot.build :airport, location: 'LHR' }

  it "provides it's current location" do
    expect(plane.location).to eq 'LGW'
  end

  it 'provides an updated location after landing' do
    plane.land(airport)
    expect(plane.location).to eq 'LHR'
  end

  it 'it knows when it is in the air ' do
    plane.take_off
    expect(plane.location).to eq 'in air'
  end
end
