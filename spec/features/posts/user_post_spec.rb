require 'rails_helper'

describe 'show one post', type: :feature do
	let(:user_id) { 1 }
	let(:posts_id) { 1 }

  context "visit /users/:user_id" do
    before(:example) { visit user_posts_path user_id }

    it "Do not redirect" do
      expect(current_path).to eq(user_posts_path user_id )
    end

    it "has placeholder text" do
      expect(page).to have_text('Posts#index')
    end
  end
end
