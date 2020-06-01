require 'rails_helper'

feature "user signs up" do
  scenario "user enters invalid name" do
    visit new_user_registration_path
    fill_in "Name", with: "Test User hhkdklsljfhhgjkfkgh"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_on "Sign up"
    expect(page).to have_content "Name is too long (maximum is 20 characters)"
  end

  scenario "user enters invalid email" do
    visit new_user_registration_path
    fill_in "Name", with: "Test User"
    fill_in "Email", with: "example.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_on "Sign up"
    expect(page).to have_content "Email is invalid"
  end

end
