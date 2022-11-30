require 'rails_helper'

RSpec.describe 'Users', type: :request do
	let(:user_id) { 1 }

  context ' GET /users' do
    before(:example) { get users_path }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'views/users/index' template" do
      expect(response).to render_template('index')
    end
  end

  context 'GET /users/:user_id' do
    before(:example) { get user_path user_id}
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'views/users/show' template" do
      expect(response).to render_template('show')
    end
  end
end
