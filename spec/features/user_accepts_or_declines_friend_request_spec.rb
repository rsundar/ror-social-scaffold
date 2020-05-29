require 'rails_helper'

feature "user accepts or declines a friend request" do
  before(:each) do
    @user = create(:user)
    @friend = create(:user)
    Friendship.request(@user, @friend)
    login_as(@friend, :scope => :user)
    visit users_path
  end

  scenario "when a friendship has been requested 2 buttons for accepting or declining invitation appear" do
    expect(page.has_button? 'Confirm friendship').to be true
    expect(page.has_button? 'Decline friendship').to be true
  end

  scenario "when a friendship invitation is accepted" do
    click_on "Confirm friendship"
    expect(page).to have_content "Friendship with #{@user.name} accepted!"
  end

  scenario "when a friendship invitation is declined" do
    click_on "Decline friendship"
    expect(page).to have_content "Friendship with #{@user.name} declined"
  end
end