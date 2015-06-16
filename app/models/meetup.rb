class Meetup < ActiveRecord::Base
  validates :organizer, presence: true
  validates :place, presence: true
  validates :description, presence: true
end
