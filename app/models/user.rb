class User < ApplicationRecord
  has_many :events_created, foreign_key: :creator_id, class_name: 'Event'
  has_many :invitations
  has_many :events_invited, through: :invitations, source: :event
end
