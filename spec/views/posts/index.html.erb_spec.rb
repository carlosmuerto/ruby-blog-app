require 'rails_helper'

describe 'posts/index.html.erb', type: :view do
	let!(:user) { User.create(name: 'Scott Wells', bio:'test bio') }
	let!(:user_commenter) { User.create(name: 'Tom', bio:'test bio') }
  let!(:posts) {
		[
			Post.create(
				author: user,
				title: 'Hello 1',
				text: 'This is my 1er post'
			),
			Post.create(
				author: user,
				title: 'Hello 2',
				text: 'This is my 2er post'
			),
			Post.create(
				author: user,
				title: 'Hello 3',
				text: 'This is my 3er post'
			),
			Post.create(
				author: user,
				title: 'Hello 4',
				text: 'This is my 4er post'
			),
		]
	}
	let!(:comments) {
		[
			Comment.new(author: user_commenter, post: posts.last, text: 'hi Scott 1'),
			Comment.new(author: user_commenter, post: posts.last, text: 'hi Scott 2'),
			Comment.new(author: user_commenter, post: posts.last, text: 'hi Scott 3'),
			Comment.new(author: user_commenter, post: posts.last, text: 'hi Scott 4'),
			Comment.new(author: user_commenter, post: posts.last, text: 'hi Scott 5'),
			Comment.new(author: user_commenter, post: posts.last, text: 'hi Scott 6'),
		]
	 }

  before(:example) {
    assign(:user, user)
    render
  }

  it 'Render user info but not bio' do
    expect(rendered).to include('Scott Wells')
    expect(rendered).to_not include('test bio')
  end

  it 'Render user info but not bio' do
    expect(rendered).to include('Scott Wells')
    expect(rendered).to_not include('test bio')
  end

	it "Render user all post" do
		posts.each do |post|
			expect(rendered).to include(post.title)
			expect(rendered).to include(post.text)
		end
	end

end
