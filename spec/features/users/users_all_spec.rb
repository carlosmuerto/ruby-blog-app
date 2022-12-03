require 'rails_helper'

describe 'show all Users', type: :feature do
  let!(:users) do
    [
      User.create(
        name: 'Tom 1',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher 1 from Mexico.'
      ),
      User.create(
        name: 'Tom 2',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher 2 from Mexico.'
      ),
      User.create(
        name: 'Tom 3',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher 3 from Mexico.'
      ),
      User.create(
        name: 'Tom 4',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher 4 from Mexico.'
      )
    ]
  end

  context 'visit /users' do
    before(:example) { visit users_path }

    it 'Do not redirect' do
      expect(current_path).to eq(users_path)
    end

    it 'show page title' do
      expect(page).to have_text('All Users')
    end

    it 'show fisrt 10 users info' do
      User.all.first(10).each do |user|
        expect(page).to have_text(user.name)
      end
    end
  end
end
