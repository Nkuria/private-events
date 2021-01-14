class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations
  has_many :attendees, through: :invitations, source: :user

  scope :upcoming_events, -> { where(creator: @current_user).where(event_date >= Time.now) }
  scope :upcoming_events, -> { where(creator: @current_user).where(event_date < Time.now) }
end
