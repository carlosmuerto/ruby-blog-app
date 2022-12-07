require 'rails_helper'

describe 'posts/index.html.erb', type: :feature do
  before :each do
    create_and_log_as_test_user
  end

  let!(:post_user) do
    Post.first.author
  end

  let!(:posts) do
    post_user.posts.order(updated_at: :desc).page
  end

  context 'visit /users/:user_id/posts' do # rubocop:disable Metrics/BlockLength
    before(:example) { visit user_posts_path post_user }

    it 'Do not redirect' do
      expect(current_path).to eq user_posts_path post_user
    end

    it "I can see the user's profile picture." do
      expect(page.find("#user_id_#{post_user.id}").find('img')['src']).to have_content post_user.photo
    end

    it "I can see the user's username." do
      expect(page).to have_text(post_user.name)
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content "posts: #{post_user.posts_count}"
    end

    it "I can see a post's title." do
      posts.each do |post|
        expect(page).to have_text(post.title.strip)
      end
    end

    it "I can see some of the post's body." do
      posts.each do |post|
        expect(page).to have_text(post.text[0..10].strip)
      end
    end

    it 'I can see the first comments on a post.' do
      posts.each do |post|
        expect(page.find("#post_id_#{post.id}")).to have_text(post.recent_comments.first.text.strip)
      end
    end

    it 'I can see how many comments a post has.' do
      posts.each do |post|
        expect(page.find("#post_id_#{post.id}")).to have_text("comments: #{post.comments.count}")
      end
    end

    it 'I can see how many likes a post has.' do
      posts.each do |post|
        expect(page.find("#post_id_#{post.id}")).to have_text(" Likes: #{post.likes.count}")
      end
    end

    it 'I can see a section for pagination if there are more posts than fit on the view.' do
      if posts.total_pages > 1
        expect(page.find('nav.pagination')).to have_text('Next')
      else
        expect(page).to have_no_css('nav.pagination')
      end
    end

    it "When I click on a post, it redirects me to that post's show page." do
      posts.each do |post|
        click_link post.title.strip
        expect(current_path).to eq user_post_path post.author, post
        visit user_path post_user
      end
    end
  end
end
