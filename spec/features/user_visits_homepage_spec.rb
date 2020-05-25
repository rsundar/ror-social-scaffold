require 'rails_helper'

feature "unsigned user visits homepage" do
  scenario "succesfully" do
    visit root_path

    expect(page).to have_css 'p', text: 'You need to sign in or sign up before continuing.'
  end
end
