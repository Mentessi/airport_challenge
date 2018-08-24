FactoryBot.define do
  factory :plane do
    location { 'LGW' }
    initialize_with { new(location) }
  end
end
