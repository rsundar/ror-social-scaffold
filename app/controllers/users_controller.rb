class UsersController < ApplicationController
  helper FriendshipsHelper
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  def friend_requests
    @friend_requests = current_user.requested_friends
  end
end
