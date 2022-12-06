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
      ),
    ]
  end

  context 'visit /users' do
    before(:example) { visit users_path }

    it 'Do not redirect' do
      expect(current_path).to eq(users_path)
    end

    it "I can see the username of all other users." do
			User.page().all.each do |user|
				expect(page).to have_content user.name
			end
		end

    it "I can see the profile picture for each user." do
			User.page().all.each do |user|
				expect(page.find("#user_id_#{user.id}").find('.user-photo')['src']).to have_content user.photo
			end
		end

    it "I can see the number of posts each user has written." do
      User.page().all.each do |user|
        expect(page).to have_content user.posts_count
      end
		end

    it "When I click on a user, I am redirected to that user's show page." do
			pending("this is pending")
			this_should_not_get_executed
		end
  end
end
