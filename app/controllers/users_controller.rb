class UsersController < ApplicationController
  helper FriendshipsHelper
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.own_and_friends_of(@user).ordered_by_most_recent
  end
end
