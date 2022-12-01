require 'rails_helper'

describe 'Posts', type: :request do
  let!(:post_user) {
		User.create(
			name: 'Tom',
			photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
			bio: 'Teacher from Mexico.'
		)
	}
  let!(:posts) {
		[
			Post.create(author: post_user,
				title: 'Hello',
				text: 'This is my 1er post'
			),
			Post.create(author: post_user,
				title: 'Hello',
				text: 'This is my 2er post'
			),
			Post.create(author: post_user,
				title: 'Hello',
				text: 'This is my 3er post'
			),
			Post.create(author: post_user,
				title: 'Hello',
				text: 'This is my 4er post'
			),
		]
	}

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
