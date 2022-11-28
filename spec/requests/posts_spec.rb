require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /users/:user_id/posts/index' do
    it 'returns http success' do
      get '/users/123/posts/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'returns http success' do
      get '/users/123/posts/321'
      expect(response).to have_http_status(:success)
    end
  end
end
