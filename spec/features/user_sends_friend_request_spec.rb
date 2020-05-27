require 'rails_helper'

feature "user sends friend request" do
  before(:each) do
    @user = create(:user)
    @other_user = create(:user)
    login_as(@user, :scope => :user)
  end

  scenario "when friendship doesn't exist a button to send friend request appears" do
    visit users_path
    click_on 'Send friend request'
    expect(page).to have_content 'Friend request sent.'
  end

  scenario "when friendships exists, user can't see button to send friend request" do
    Friendship.request(@user, @other_user)
    visit users_path
    expect(page.has_button? 'Send friend request').to be false
  end

  scenario "user can't see a button to send friend request to himself" do
    @other_user.destroy
    visit users_path
    expect(page.has_button? 'Send friend request').to be false
  end
end