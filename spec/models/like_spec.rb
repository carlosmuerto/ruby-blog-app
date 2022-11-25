require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:post_user) { User.create( name: 'Tom')}

  let(:helper_user) {
    User.create( name: 'Tom helper')
  }

  let(:post) {
    Post.create(author: post_user, title: 'Hello', text: 'This is my 1er post')
  }

  subject {
		Like.new(author:helper_user, post:post)
  }

  context "like belongs_to a author" do
    it "most have a Author" do
      subject.author = nil
      expect(subject).to_not be_valid
    end
  end

	context "like bolongs_to a post" do
    it "most have a post" do
      subject.post = nil
      expect(subject).to_not be_valid
    end

    it "add 1 to post counter" do
      expect(subject.post.likes_counter).to eq 0
      subject.save
      expect(subject.post.likes_counter).to eq 1
    end
	end

	it "a user cant like twice" do
		subject.save

		other_like = Like.new(author:helper_user, post:post)
		expect(other_like).to_not be_valid
	end

end
