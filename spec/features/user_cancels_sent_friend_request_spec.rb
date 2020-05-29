require 'rails_helper'

feature "user cancels sent friend request" do
  before(:each) do
    @user = create(:user)
    @friend = create(:user)
    Friendship.request(@user, @friend)
    login_as(@user, :scope => :user)
    visit users_path
  end

  scenario "when user has previously requested a friendship, a button to cancel the request appears" do
    expect(page.has_button? 'Cancel friend request').to be true
  end

  scenario "when a friendship request is canceled" do
    click_on "Cancel friend request"
    expect(page).to have_content "Friendship request canceled."
  end
end