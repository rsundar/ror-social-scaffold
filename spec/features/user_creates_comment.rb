require 'rails_helper'

feature "User creates a comment" do
  let!(:user) { create(:user) }
  let!(:post) { create(:post) }

  scenario "user creates a valid comment" do
    login_as(user, :scope => :user)
    post
    visit root_path
    fill_in "comment_content" with: "This is my first comment!"
    click_on "Comment"
    expect(page).to have_content "Comment was successfully created."
  end

  scenario "user creates an empty comment" do
    login_as(user, :scope => :user)
    post
    visit root_path
    fill_in "comment_content" with: ""
    click_on "Comment"
    expect(page).to have_content "Content can't be blank"
  end

  scenario "user creates a comment with more than 200 characters" do
    login_as(user, :scope => :user)
    post
    visit root_path
    fill_in "comment_content" with: "a"*201
    click_on "Comment"
    expect(page).to have_content "Content 200 characters in comment is the maximum allowed."
  end
end