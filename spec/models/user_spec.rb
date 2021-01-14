require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user creation' do
    it 'creates user correctly' do
      @user = User.new(name: 'Peter')
      expect(@user.valid?).to be true
    end
    it 'user name can not be empty' do
      @user = User.new(name: '')
      expect(@user.valid?).to be false
    end
    it 'user name must be unique' do
      @user = User.create(name: 'John')
      @user2 = User.new(name: 'John')
      expect(@user2.valid?).to be false
    end
  end
end
