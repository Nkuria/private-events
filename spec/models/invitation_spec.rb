require 'rails_helper'

RSpec.describe Invitation, type: :model do
  describe 'invitation creation' do
    let(:user1) { User.create(name: 'John') }
    let(:user2) { User.create(name: 'Peter') }
    let(:event1) { Event.create(location: 'House', event_date: Time.now, creator: user1) }

    it 'creates invitation correctly' do
      invitation = Invitation.new(user: user1, event: event1)
      expect(invitation.valid?).to be true
    end

    it 'invitation pair can not repeat' do
      Invitation.create(user: user1, event: event1)
      invitation = Invitation.new(user: user1, event: event1)
      expect(invitation.valid?).to be false
    end

    it 'user_id can not be nil' do
      invitation = Invitation.new(event: event1)
      expect(invitation.valid?).to be false
    end

    it 'event_id can not be nil' do
      invitation = Invitation.new(user: user1)
      expect(invitation.valid?).to be false
    end
  end
end
