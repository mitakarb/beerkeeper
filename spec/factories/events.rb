FactoryBot.define do
  factory :event do
    organizer factory: :user
    start_at { Time.current + 1.day }
    end_at { Time.current + 1.day + 1.hour }
    name { 'The event' }
  end
end
