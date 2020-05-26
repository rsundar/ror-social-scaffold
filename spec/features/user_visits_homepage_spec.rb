require "rails_helper"

feature "User visits homepage" do
    scenario "Without logging in or signing up" do
        visit root_path

        expect(page).to have_css 'p', text:'Please log in or sign up to continue!'
    end
end