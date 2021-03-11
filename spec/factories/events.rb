FactoryBot.define do
  factory :event do
    organizer factory: :user
    name { 'The event' }
  end
end
