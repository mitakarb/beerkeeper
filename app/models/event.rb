class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :name, presence: true

  def organizer?(user)
    # TODO: Rails 7.2 系にしたら & を外す
    # https://github.com/mitakarb/beerkeeper/pull/895#issuecomment-2275713135
    organizer_id == user&.id
  end
end
