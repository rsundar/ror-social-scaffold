class FriendshipsController < ApplicationController
  before_action :setup_friends

  private

    def setup_friends
      @user = current_user
      @friend = User.find(params[:id])
    end
end
