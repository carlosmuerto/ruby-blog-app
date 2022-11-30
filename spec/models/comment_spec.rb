require 'rails_helper'

describe Comment, type: :model do
  let(:post_user) { User.create(name: 'Tom') }

  let(:helper_user) do
    User.create(name: 'Tom helper')
  end

  let(:post) do
    Post.create(author: post_user, title: 'Hello', text: 'This is my 1er post')
  end

  subject do
    Comment.new(author: helper_user, post:, text: 'hi Tom')
  end

  context 'comment belongs_to a author' do
    it 'most have a Author' do
      subject.author = nil
      expect(subject).to_not be_valid
    end
  end

  context 'comment bolongs_to a post' do
    it 'most have a post' do
      subject.post = nil
      expect(subject).to_not be_valid
    end

    it 'add 1 to post comment counter' do
      expect(subject.post.comments_counter).to eq 0
      subject.save
      expect(subject.post.comments_counter).to eq 1
    end
  end
end
