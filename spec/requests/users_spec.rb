require 'rails_helper'

describe 'Users', type: :request do
  let(:user) do
    User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.'
    )
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
