class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations
  has_many :attendees, through: :invitations, source: :user
  validates :location, presence: true
  validates :event_date, presence: true
  validates :description, presence: true

  scope :upcoming_events, -> { where('event_date >= ?', Time.now) }
  scope :previous_events, -> { where('event_date <  ?', Time.now) }
end
