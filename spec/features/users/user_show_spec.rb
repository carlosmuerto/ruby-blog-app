require 'rails_helper'

describe 'show one User', type: :feature do
  let(:user) {
		User.create(
			name: 'Tom',
			photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
			bio: 'Teacher from Mexico.'
		)
	}

  context 'visit /users/:user_id' do
    before(:example) { visit user_path user.id }

    it 'Do not redirect' do
      expect(current_path).to eq(user_path(user.id))
    end

    it 'has placeholder text' do
      expect(page).to have_text(user.name)
    end
  end
end
