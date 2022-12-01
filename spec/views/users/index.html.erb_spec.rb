require 'rails_helper'

describe 'users/index.html.erb', type: :view do
  before(:example) {
    assign(:users, [
      User.create(
        name: 'Scott Wells',
      ),

      User.create(
        name: 'Ella Green',
      ),
    ])
    render
  }

  it 'render all users name' do
    expect(rendered).to include('Scott Wells')
    expect(rendered).to include('Ella Green')
  end
end
