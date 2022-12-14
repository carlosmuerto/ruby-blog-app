require 'rails_helper'

describe 'show all Users', type: :feature do
  before :each do
    create_and_log_as_test_user
  end

  context 'visit /users' do
    before(:example) do
      visit users_path
    end

    it 'Do not redirect' do
      expect(current_path).to eq(users_path)
    end

    it 'I can see the username of all other users' do
      User.page.all.each do |user|
        expect(page).to have_content user.name
      end
    end

    it 'I can see the profile picture for each user' do
      User.page.all.each do |user|
        expect(page.find("#user_id_#{user.id}").find('.user-photo')['src']).to have_content user.photo
      end
    end

    it 'I can see the number of posts each user has written.' do
      User.page.all.each do |user|
        expect(page.find("#user_id_#{user.id}")).to have_content "posts: #{user.posts_count}"
      end
    end

    it "When I click on a user, I am redirected to that user's show page." do
      User.page.all.each do |user|
        click_link user.name
        expect(current_path).to eq user_path user
        visit users_path
      end
    end
  end
end
