require 'rails_helper'

describe 'Users', type: :request do
  before :each do
    create_and_log_as_test_user
  end
  
  let!(:user) do
    User.first
  end

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
    before(:example) { get user_path user.id }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'views/users/show' template" do
      expect(response).to render_template('show')
    end
  end
end
