require 'rails_helper'

describe "new user" do
  context "Go to home page" do
    it "opens homepage" do
      visit(root_path)
      within('nav.navbar')
      expect(page).to have_content('Sign up')
    end
  end
end