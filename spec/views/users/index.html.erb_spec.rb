require 'rails_helper'

describe 'users/index.html.erb', type: :view do
  before(:example) { render }
  it 'has placeholder text' do # Find me in app/views/users/index.html.erb
    expect(rendered).to include('Find me in app/views/users/index.html.erb')
  end
end
