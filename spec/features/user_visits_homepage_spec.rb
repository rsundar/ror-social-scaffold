require 'rails_helper'

feature "user visits homepage" do
  scenario "unsigned user visits homepage" do
    visit root_path

    expect(page).to have_css 'p', text: 'You need to sign in or sign up before continuing.'
  end

  scenario "signed_in user visits homepage" do
    user = User.create!(name: 'test3', :email => 'test3@example.com', :password => 'f4k3p455w0rd')
    login_as(user, :scope => :user)
    visit root_path

    expect(page).to have_css 'h3', text: 'Recent posts'
  end
end
