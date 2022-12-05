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

    it "I can see the user's profile picture." do
			pending("this is pending")
			this_should_not_get_executed
		end

    it "I can see the user's username." do
			pending("this is pending")
			this_should_not_get_executed
		end

    it "I can see the number of posts the user has written." do
			pending("this is pending")
			this_should_not_get_executed
		end

    it "I can see a post's title." do
			pending("this is pending")
			this_should_not_get_executed
		end

    it "I can see some of the post's body." do
			pending("this is pending")
			this_should_not_get_executed
		end

    it "I can see the first comments on a post." do
			pending("this is pending")
			this_should_not_get_executed
		end

    it "I can see how many comments a post has." do
			pending("this is pending")
			this_should_not_get_executed
		end

    it "I can see how many likes a post has." do
			pending("this is pending")
			this_should_not_get_executed
		end

    it "I can see a section for pagination if there are more posts than fit on the view." do
			pending("this is pending")
			this_should_not_get_executed
		end

    it "When I click on a post, it redirects me to that post's show page." do
			pending("this is pending")
			this_should_not_get_executed
		end
  end
end
