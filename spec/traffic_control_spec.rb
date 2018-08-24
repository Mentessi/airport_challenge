require 'spec_helper'

RSpec.describe 'traffic control' do

  let!(:traffic_control) { FactoryBot.build :traffic_control }
  let!(:gatwick_airport) { FactoryBot.build :airport }
  let!(:plane) { FactoryBot.build :plane, location: 'in air' }
  let!(:heathrow_plane) { FactoryBot.build :plane, location: 'LHR' }

  before(:each) do
    allow(traffic_control).to receive(:sunny?) { true }
  end

  it 'can instruct a plane to land at an airport' do
    traffic_control.instruct_to_land(plane, gatwick_airport)
    expect(plane.location).to eq 'LGW'
  end

  it 'can instruct a parked plane to take off from an airport' do
    traffic_control.instruct_to_land(plane, gatwick_airport)
    expect(plane.location).to eq 'LGW'
    traffic_control.instruct_to_take_off(plane, gatwick_airport)
    expect(plane.location).to eq 'in air'
    expect(gatwick_airport.parking_bays).not_to include plane
  end

  it 'cannot land a plane that is already on the ground' do
    traffic_control.instruct_to_land(plane, gatwick_airport)
    expect { traffic_control.instruct_to_land(plane, gatwick_airport) }.to raise_error 'Permission denied'
  end

  it 'cannot instruct a plane take off that is already in the air' do
    expect(plane.location).to eq 'in air'
    expect { traffic_control.instruct_to_take_off(plane, gatwick_airport) }.to raise_error 'Permission denied'
  end

  it 'cannot instruct a plane to take off from an airport it is not in' do
    expect(heathrow_plane.location).to eq 'LHR'
    expect { traffic_control.instruct_to_take_off(heathrow_plane, gatwick_airport) }.to raise_error 'Permission denied'
  end

  it 'does not allow landings in bad weather' do
    allow(traffic_control).to receive(:sunny?) { false }
    expect { traffic_control.instruct_to_land(plane, gatwick_airport) }.to raise_error 'Permission denied'
  end

  it 'does not allow take off in bad weather' do
    allow(traffic_control).to receive(:sunny?) { false }
    expect { traffic_control.instruct_to_take_off(plane, gatwick_airport) }.to raise_error 'Permission denied'
  end
end
