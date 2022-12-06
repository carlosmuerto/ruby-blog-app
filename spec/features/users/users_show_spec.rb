require 'rails_helper'

describe 'show one User', type: :feature do
  let!(:post_user) do
    Post.first.author
  end

  let!(:posts) do
    post_user.recent_posts
  end

  context 'visit /users/:user_id' do # rubocop:disable Metrics/BlockLength
    before(:example) { visit user_path post_user }

    it 'Do not redirect' do
      expect(current_path).to eq user_path post_user
    end

    it "I can see the user's profile picture." do
      expect(page.find("#user_id_#{post_user.id}").find('img')['src']).to have_content post_user.photo
    end

    it "I can see the user's username." do
      expect(page).to have_text(post_user.name)
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_text("posts: #{posts.count}")
    end

    it "I can see the user's bio." do
      expect(page).to have_text(post_user.bio)
    end

    it "I can see the user's first 3 posts." do
      posts.each do |post|
        expect(page).to have_text(post.title.strip)
        expect(page).to have_text(post.text[0..10].strip)
      end
    end

    it "I can see a button that lets me view all of a user's posts." do
      expect(page).to have_text('see all posts')
    end

    it "When I click a user's post, it redirects me to that post's show page." do
      posts.each do |post|
        click_link post.title.strip
        expect(current_path).to eq user_post_path post.author, post
        visit user_path post_user
      end
    end

    it "When I click to see all posts, it redirects me to the user's post's index page." do
      click_link 'see all posts'
      expect(current_path).to eq user_posts_path post_user
    end
  end
end
