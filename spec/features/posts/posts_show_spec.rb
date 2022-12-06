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
      expect(page).to have_text post.title
    end

    it 'I can see who wrote the post.' do
			expect(page).to have_text "by: #{post_user.name}"
		end

    it 'I can see how many comments it has.' do
			expect(page).to have_text("comments: #{post.comments.count}")
		end

    it 'I can see how many likes it has.' do
			expect(page).to have_text("Likes: #{post.likes.count}")
		end

    it 'I can see the post body.' do
			expect(page).to have_text(post.text.first(10).strip)
			expect(page).to have_text(post.text.last(10).strip)
		end

    it 'I can see the username of each commentor.' do
			post.comments.page.includes(:author).each do |comment|
				expect(page.find("#comment-#{comment.id}")).to have_text(comment.author.name)
			end
		end

    it 'I can see the comment each commentor left.' do
			post.comments.page.includes(:author).each do |comment|
				expect(page.find("#comment-#{comment.id}")).to have_text(comment.text)
			end
		end

		context "like functionality" do

			it 'I has like button' do
				expect(page).to have_css('.like-btn')
			end

			it 'when press like button add one to like' do
				prev_like = post.likes.count
				expect(page).to have_text("Likes: #{prev_like}")
				page.find(".like-btn").click
				expect(current_path).to eq user_post_path post_user, post
				expect(page).to have_text("Likes: #{(prev_like + 1)}")
			end

		end

  end
end
