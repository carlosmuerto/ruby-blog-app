require 'rails_helper'

describe 'posts/index.html.erb', type: :feature do
  let!(:post_user) do
    User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.'
    )
  end
  let!(:posts) do
    [
      Post.create(author: post_user,
                  title: 'Hello',
                  text: 'This is my 1er post'),
      Post.create(author: post_user,
                  title: 'Hello',
                  text: 'This is my 2er post'),
      Post.create(author: post_user,
                  title: 'Hello',
                  text: 'This is my 3er post'),
      Post.create(author: post_user,
                  title: 'Hello',
                  text: 'This is my 4er post')
    ]
  end

  context 'visit /users/:user_id' do
    before(:example) { visit user_post_path post_user, posts[0] }

    it 'Do not redirect' do
      expect(current_path).to eq(user_post_path(post_user, posts[0]))
    end
  end
end
