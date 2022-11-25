require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post_user) {
    User.new(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'poster'
    )
  }

  let(:helper_user) {
    User.new(
      name: 'Tom helper',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'helper'
    )
  }

  subject {
    Post.create(author: post_user, title: 'Hello', text: 'This is my 1er post')
  }

  before do
    #subject.save
  end

  context "title validations " do
    it "title should be present" do
      subject.title = nil
      expect(subject).to_not be_valid
      subject.title = 'asdf'
      expect(subject).to be_valid
    end
    it "not cant be too long (250)" do
      subject.title = "0" * 300 # a long string of "0"
      expect(subject).to_not be_valid
    end
  end

  context "post belongs_to a author" do
    it "most have a Author" do
      subject.author = nil
      expect(subject).to_not be_valid
    end

    it "post's author has already 1 post" do
      expect(subject.author.posts_count).to eq 1
    end


    it "new post increate author post counter" do
      Post.create(author: subject.author, title: 'Hello', text: 'This is my 2er post')
      expect(subject.author.posts_count).to eq 2
    end

  end
end
