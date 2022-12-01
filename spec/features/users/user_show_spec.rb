require 'rails_helper'

describe 'show one User', type: :feature do
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
    before(:example) { visit user_path post_user.id }

    it 'Do not redirect' do
      expect(current_path).to eq(user_path(post_user.id))
    end

    it 'render user name' do
      expect(page).to have_text(post_user.name)
    end

    it 'render user bio' do
      expect(page).to have_text(post_user.bio)
    end

    it 'render only recents posts' do
      post_user.recent_posts.each do |post|
        expect(page).to have_text(post.title)
        expect(page).to have_text(post.text)
      end
      older_post = posts - post_user.recent_posts
      older_post.each do |post|
        expect(page).to_not have_text(post.text)
      end
    end
  end
end
