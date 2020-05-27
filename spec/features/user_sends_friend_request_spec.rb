require 'rails_helper'

feature "user sends friend request" do
  scenario "when friendship doesn't exist a button to send friend request appears" do
    user = create(:user)
    other_user = create(:user)
    login_as(user, :scope => :user)
    visit users_path
    click_on 'Send friend request'

    expect(page).to have_content 'Friend request sent.'
  end

  scenario "user can't see a button to send friend request to himself" do
    user = create(:user)
    login_as(user, :scope => :user)
    visit users_path

    expect(page.has_button? 'Send friend request').to be false
  end

  scenario "when friendships exists, user can't see button to send friend request" do
    user = create(:user)
    other_user = create(:user)
    login_as(user, :scope => :user)
    Friendship.request(user, other_user)
    visit users_path
    
    expect(page.has_button? 'Send friend request').to be false
  end
end