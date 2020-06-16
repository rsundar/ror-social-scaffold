class UsersController < ApplicationController
  helper FriendshipsHelper
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = is_friendship_accepted?(current_user, @user) ? @user.posts.ordered_by_most_recent.includes(:user) : "private_profile"
  end

  def friend_requests
    @friend_requests = current_user.requested_friends
  end

  private

  def is_friendship_accepted?(current_user, user)
    return true if current_user == user

    friendship = Friendship.find_by_user_id_and_friend_id(current_user, user)
    return false if friendship.nil? || friendship.status != 'accepted'

    return friendship.status == 'accepted'
  end
end
