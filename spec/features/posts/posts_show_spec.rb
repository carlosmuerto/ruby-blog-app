require 'rails_helper'

describe 'show one post', type: :feature do
  let!(:post_user) do
    Post.first.author
  end

  let!(:post) do
    post_user.posts.first
  end

  context 'visit /users/:user_id/posts/:id' do
    before(:example) { visit user_post_path post_user, post }

    it 'Do not redirect' do
      expect(current_path).to eq user_post_path post_user, post
    end

    it 'do not render user bio' do
      expect(page).to_not have_text post_user.bio
    end

    it "I can see the post's title." do
      expect(page).to have_text post_user.name
    end

    it 'I can see who wrote the post.'

    it 'I can see how many comments it has.'

    it 'I can see how many likes it has.'

    it 'I can see the post body.'

    it 'I can see the username of each commentor.'

    it 'I can see the comment each commentor left.'
  end
end
