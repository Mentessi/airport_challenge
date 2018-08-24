FactoryBot.define do
  factory :airport do
    location { 'LGW' }
    parking_spaces { 1 }
    initialize_with { new(location, parking_spaces) }
  end
end
