require 'rails_helper'

describe 'Posts', type: :request do
	let(:user_id) { 1 }
	let(:posts_id) { 1 }

  context ' GET /users/:user_id/posts' do
    before(:example) { get user_posts_path user_id }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'views/posts/index' template" do
      expect(response).to render_template('index')
    end
  end

  context 'GET /users/:user_id/posts/:posts_id' do
    before(:example) { get user_post_path user_id, posts_id}
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'views/posts/show' template" do
      expect(response).to render_template('show')
    end
  end
end
