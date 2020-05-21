class FriendshipsController < ApplicationController
  before_action :setup_friends

  def create
    Friendship.request(@user, @friend)
    flash[:notice] = 'Friend request sent.'
    redirect_to @friend
  end

  private

    def setup_friends
      @user = current_user
      @friend = User.find(params[:id])
    end
end
