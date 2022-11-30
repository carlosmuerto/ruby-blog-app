require 'rails_helper'

describe 'posts/index.html.erb', type: :view do
	before(:example) { render }
  it "has placeholder text" do # Find me in app/views/posts/index.html.erb
		expect(rendered).to include("Find me in app/views/posts/index.html.erb")
	end
end
