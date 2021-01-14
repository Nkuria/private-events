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
  end
end
