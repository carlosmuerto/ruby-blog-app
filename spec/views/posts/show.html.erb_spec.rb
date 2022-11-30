require 'rails_helper'

describe 'posts/show.html.erb', type: :view do
  before(:example) { render }
  it 'has placeholder text' do # Find me in app/views/posts/show.html.erb
    expect(rendered).to include('Find me in app/views/posts/show.html.erb')
  end
end
