require 'rails_helper'

describe Like, type: :model do
  let(:post_user) {
		let_user = User.new(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'poster',
			email: 'test@test.com',
			password: 'SuperCoolTestPass'
    )
		let_user.confirmed_at = Time.now
		let_user.save
		let_user
	 }

  let(:helper_user) do
    let_user = User.new(
      name: 'Tom helper',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'helper',
			email: 'test-helper@test.com',
			password: 'SuperCoolTestPass',
    )
		let_user.confirmed_at = Time.now
		let_user.save
		let_user
  end

  let(:post) do
    Post.create(author: post_user, title: 'Hello', text: 'This is my 1er post')
  end

  subject do
    Like.new(author: helper_user, post:)
  end

  context 'like belongs_to a author' do
    it 'most have a Author' do
      subject.author = nil
      expect(subject).to_not be_valid
    end
  end

  context 'like bolongs_to a post' do
    it 'most have a post' do
      subject.post = nil
      expect(subject).to_not be_valid
    end

    it 'add 1 to post counter' do
      expect(subject.post.likes_counter).to eq 0
      subject.save
      expect(subject.post.likes_counter).to eq 1
    end
  end

  it 'a user cant like twice' do
    subject.save

    other_like = Like.new(author: helper_user, post:)
    expect(other_like).to_not be_valid
  end
end
