require 'rails_helper'

feature "user removes a friendship" do
  before(:each) do
    @user = create(:user)
    @friend = create(:user)
    Friendship.request(@user, @friend)
    Friendship.accept(@user, @friend)
    login_as(@user, :scope => :user)
    visit users_path
  end

  scenario "when user has an accepted friendship, a button to remove the friendship appears" do
    expect(page.has_button? 'Remove friendship').to be true
  end

  scenario "when a friendship is removed" do
    click_on "Remove friendship"
    expect(page).to have_content "Friendship with #{@friend.name} deleted!"
  end
end