require 'rails_helper'

describe 'users/show.html.erb', type: :view do
	let!(:user) { User.create(name: 'Scott Wells', bio:'test bio') }
	let!(:post) { Post.create(author: user, title: 'Hello', text: 'This is my 1er post') }

  before(:example) {
    assign(:user, user)
    render
  }

  it 'Render user info' do
    expect(rendered).to include('Scott Wells')
    expect(rendered).to include('test bio')
  end

	it "Render post content" do
    expect(rendered).to include('Hello')
    expect(rendered).to include('This is my 1er post')
	end

end
