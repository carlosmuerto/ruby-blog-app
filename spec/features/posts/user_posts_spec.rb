require 'rails_helper'

describe 'posts/index.html.erb', type: :feature do
	let(:user_id) { 1 }
	let(:posts_id) { 1 }

  context "visit /users/:user_id" do
    before(:example) { visit user_post_path user_id, posts_id }

    it "Do not redirect" do
      expect(current_path).to eq(user_post_path user_id, posts_id )
    end

    it "has placeholder text" do
      expect(page).to have_text('Posts#show')
    end
  end
end
