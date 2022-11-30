require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe ' GET /users' do
    before(:example) { get users_path }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'users/index' template" do
      expect(response).to render_template('index')
    end
  end

  describe 'GET /users/:id' do
    before(:example) { get user_path 1}
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'user/show' template" do
      expect(response).to render_template('show')
    end
  end
end
