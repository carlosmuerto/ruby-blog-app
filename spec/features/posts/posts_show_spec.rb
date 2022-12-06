require 'rails_helper'

describe 'show one post', type: :feature do
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
  let!(:comments) do
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
    before(:example) { visit user_posts_path post_user }

    it 'Do not redirect' do
      expect(current_path).to eq(user_posts_path(post_user))
    end

    it 'do not render user bio' do
      expect(page).to_not have_text(post_user.bio)
    end

    it "I can see the post's title." do
      expect(page).to have_text(post_user.name)
    end

    it 'I can see who wrote the post.' do
      pending('this is pending')
      this_should_not_get_executed
    end

    it 'I can see how many comments it has.' do
      pending('this is pending')
      this_should_not_get_executed
    end

    it 'I can see how many likes it has.' do
      pending('this is pending')
      this_should_not_get_executed
    end

    it 'I can see the post body.' do
      pending('this is pending')
      this_should_not_get_executed
    end

    it 'I can see the username of each commentor.' do
      pending('this is pending')
      this_should_not_get_executed
    end

    it 'I can see the comment each commentor left.' do
      pending('this is pending')
      this_should_not_get_executed
    end

    it 'I can see a timestamp with the date and time that the post was created.' do
      pending('this is pending')
      this_should_not_get_executed
    end

    it 'I can see a timestamp with the date and time that each comment was created.' do
      pending('this is pending')
      this_should_not_get_executed
    end
  end
end
