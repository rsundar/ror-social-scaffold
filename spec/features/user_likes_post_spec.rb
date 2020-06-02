require 'rails_helper'

feature "user likes or dislikes post" do
  let!(:user) { create(:user) }
  let!(:post) { user.posts.create(content: "This is a test post for rspec and capybara") }

  scenario "user likes post" do
    login_as(user, :scope => :user)
    post
    visit root_path
    click_on "Like!"
    expect(page).to have_content "You liked a post."
  end

  scenario "user dislikes post" do
    login_as(user, :scope => :user)
    post
    visit root_path
    click_on "Like!"
    click_on "Dislike!"
    expect(page).to have_content "You disliked a post."
  end
end