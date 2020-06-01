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

  scenario "user enters invalid password" do
    visit new_user_registration_path
    fill_in "Name", with: "Test User"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "12345"
    fill_in "Password confirmation", with: "12345"
    click_on "Sign up"
    expect(page).to have_content "Password is too short (minimum is 6 characters)"
  end

  scenario "user enters valid information" do
    visit new_user_registration_path
    fill_in "Name", with: "Test User"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_on "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end
