require 'rails_helper'

describe 'Posts', type: :request do
  before :each do
    create_and_log_as_test_user
  end
  
  let!(:posts) do
    Post.all
  end

  let!(:post_user) do
    posts[0].author
  end

  context ' GET /users/:user_id/posts' do
    before(:example) { get user_posts_path post_user }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'views/posts/index' template" do
      expect(response).to render_template('index')
    end
  end

  context 'GET /users/:user_id/posts/:posts_id' do
    before(:example) { get user_post_path post_user, posts[0] }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it "renders 'views/posts/show' template" do
      expect(response).to render_template('show')
    end
  end
end
