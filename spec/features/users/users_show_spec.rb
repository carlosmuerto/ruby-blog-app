require 'rails_helper'

describe 'show one User', type: :feature do
	let!(:post_user) {
		User.first
	}

	let!(:posts) {
		post_user.posts
	}

  context 'visit /users/:user_id' do
    before(:example) { visit user_path post_user }

    it 'Do not redirect' do
      expect(current_path).to eq user_path post_user
    end

    it "I can see the user's profile picture."

    it "I can see the user's username." do
      expect(page).to have_text(post_user.name)
    end

		it "I can see the number of posts the user has written."

    it "I can see the user's bio." do
      expect(page).to have_text(post_user.bio)
    end

    it "I can see the user's first 3 posts." do
      post_user.recent_posts.each do |post|
        expect(page).to have_text(post.title)
        expect(page).to have_text(post.text)
      end
    end

		it "I can see a button that lets me view all of a user's posts."

		it "When I click a user's post, it redirects me to that post's show page."

		it "When I click to see all posts, it redirects me to the user's post's index page."

	end
end
