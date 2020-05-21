class FriendshipsController < ApplicationController
  before_action :setup_friends

  def create
    Friendship.request(@user, @friend)
    flash[:notice] = 'Friend request sent.'
    redirect_to @friend
  end

  def accept
    if @user.requested_friends.include?(@friend)
      Friendship.accept(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.name} accepted!"
    else
      flash[:notice] = "No friendship request from #{@friend.name}."
    end
    redirect_to current_user
  end

  private

    def setup_friends
      @user = current_user
      @friend = User.find(params[:id])
    end
end
