require 'rails_helper'

describe 'show all Users', type: :feature do
  let(:user_id) { 1 }

  context 'visit /users' do
    before(:example) { visit users_path }

    it 'Do not redirect' do
      expect(current_path).to eq(users_path)
    end

    it 'has placeholder text' do
      expect(page).to have_text('All Users')
    end
  end
end
