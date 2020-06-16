requires 'rails_helper'

feature 'user creates a post' do
  let!(:user) { create(:user) }

  scenario "user creates a valid post" do
    login_as(user, :scope => :user)
    visit root_path
    fill_in "content" with: "This is a new post"
    click_on "Save"
    expect(page).to have_content "Post was successfully created."
  end

  scenario "user creates an empty post" do
    login_as(user, :scope => :user)
    visit root_path
    fill_in "content" with: ""
    click_on "Save"
    expect(page).to have_content "Post could not be saved. Content can't be blank"
  end

  scenario "user creates a post with more than 1000 characters" do
    login_as(user, :scope => :user)
    visit root_path
    fill_in "content" with: "a"*1001
    click_on "Save"
    expect(page).to have_content "Post could not be saved. Content 1000 characters in post is the maximum allowed"
  end
end