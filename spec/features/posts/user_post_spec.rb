require 'rails_helper'

describe 'show one post', type: :feature do
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

  context "visit /users/:user_id" do
    before(:example) { visit user_posts_path post_user }

    it 'Do not redirect' do
      expect(current_path).to eq(user_posts_path(post_user))
    end

    it 'render user name' do
      expect(page).to have_text(post_user.name)
    end

    it 'do not render user bio' do
      expect(page).to_not have_text(post_user.bio)
    end

    it "render all posts" do
      posts.each do |post|
        expect(page).to have_text(post.title)
        expect(page).to have_text(post.text)
      end
    end


  end
end
