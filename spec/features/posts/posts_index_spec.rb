require 'rails_helper'

describe 'posts/index.html.erb', type: :feature do
	let!(:post_user) {
		Post.first.author
	}

	let!(:posts) {
		post_user.posts
	}

  context 'visit /users/:user_id/posts' do
    before(:example) { visit user_posts_path post_user }

    it 'Do not redirect' do
      expect(current_path).to eq user_posts_path post_user
    end

    it "I can see the user's profile picture." do
			User.page().all.each do |user|
				expect(page.find("#user_id_#{user.id}").find('.user-photo')['src']).to have_content user.photo
			end
		end

    it "I can see the user's username."

    it "I can see the number of posts the user has written."

    it "I can see a post's title."

    it "I can see some of the post's body."

    it "I can see the first comments on a post."

    it "I can see how many comments a post has."

    it "I can see how many likes a post has."

    it "I can see a section for pagination if there are more posts than fit on the view."

    it "When I click on a post, it redirects me to that post's show page."

	end
end
