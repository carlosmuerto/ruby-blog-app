require 'rails_helper'

describe User, type: :model do
  subject do
    User.new(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
			email: 'test@test.com',
			password: 'SuperCoolTestPass',
			confirmed_at: Time.now
    )
  end

  before do
    subject.save

    Post.create(author: subject, title: 'Hello', text: 'This is my 1er post')
    Post.create(author: subject, title: 'Hello', text: 'This is my 2do post')
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  context 'posts_count validations' do
    it 'posts_count should be a number' do
      subject.posts_count = 5.5
      expect(subject).to_not be_valid
    end

    it "posts_count can't be negative" do
      subject.posts_count = -1
      expect(subject).to_not be_valid
    end

    it 'posts_count can be 0' do
      subject.posts_count = 0
      expect(subject).to be_valid
    end

    it "posts_count can't be positive" do
      subject.posts_count = 1
      expect(subject).to be_valid
    end
  end

  it 'should have 2 post' do
    expect(subject.recent_posts.length).to eq 2
    expect(subject.posts.length).to eq 2
  end

  context 'after add 2 new post' do
    before do
      Post.create(author: subject, title: 'Hello', text: 'This is my 3er post')
      Post.create(author: subject, title: 'Hello', text: 'This is my 4th post')
    end

    it 'should have 4 post' do
      expect(subject.posts.length).to eq 4
    end

    it 'recent_posts should return max 3 post' do
      expect(subject.recent_posts.length).to eq 3
    end

    it 'the most (first) recent_posts should be the 4th' do
      expect(subject.recent_posts.first.text).to eq 'This is my 4th post'
    end
  end
end
