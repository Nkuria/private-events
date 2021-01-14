class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :events_created, foreign_key: :creator_id, class_name: 'Event'
  has_many :invitations
  has_many :events_invited, through: :invitations, source: :event
end
