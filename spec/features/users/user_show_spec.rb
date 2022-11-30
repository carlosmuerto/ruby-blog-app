require 'rails_helper'

describe 'show one User', type: :feature do
  let(:user_id) { 1 }

  context "visit /users/:user_id" do
    before(:example) { visit user_path user_id}

    it "Do not redirect" do
      expect(current_path).to eq(user_path user_id)
    end

    it "has placeholder text" do
      expect(page).to have_text('Users#show')
    end
  end
end
