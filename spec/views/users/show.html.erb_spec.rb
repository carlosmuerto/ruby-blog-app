require 'rails_helper'

describe 'users/show.html.erb', type: :view do
  before(:example) { render }
  it 'has placeholder text' do # Find me in app/views/users/show.html.erb
    expect(rendered).to include('Find me in app/views/users/show.html.erb')
  end
end
