require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  before :example do
    get login_path
  end

  it 'is a success' do
    expect(response).to have_http_status(:ok)
  end

  it 'renders new_session_path' do
    expect(response).to render_template('sessions/new')
  end
end
