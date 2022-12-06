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

    it "I can see the user's profile picture." do
      pending('this is pending!!!!!')
      this_should_not_get_executed
    end

    it "I can see the user's username." do
      expect(page).to have_text(post_user.name)
    end

    it 'I can see the number of posts the user has written.' do
      pending('this is pending')
      this_should_not_get_executed
    end

    it "I can see the user's bio." do
      expect(page).to have_text(post_user.bio)
    end

    it "I can see the user's first 3 posts." do
      post_user.recent_posts.each do |post|
        expect(page).to have_text(post.title)
        expect(page).to have_text(post.text)
      end
      older_post = posts - post_user.recent_posts
      older_post.each do |post|
        expect(page).to_not have_text(post.text)
      end

    it "I can see a button that lets me view all of a user's posts." do
      pending('this is pending')
      this_should_not_get_executed
    end

    it "When I click a user's post, it redirects me to that post's show page." do
      pending('this is pending')
      this_should_not_get_executed
    end

    it "When I click to see all posts, it redirects me to the user's post's index page." do
      pending('this is pending')
      this_should_not_get_executed
    end

    it 'I can see a section for statistics.' do
      pending('this is pending')
      this_should_not_get_executed
    end

    it "I can see the total comments that have been posted on the user's posts." do
      pending('this is pending')
      this_should_not_get_executed
    end

    it 'I can see the number of comments per post.' do
      pending('this is pending')
      this_should_not_get_executed
    end
  end
end
