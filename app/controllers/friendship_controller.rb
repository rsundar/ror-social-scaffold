class FriendshipController < ApplicationController
  before_action :setup
  
  def create
    Friendship.transaction do
      
      
    end
  end

  def update
  end

  def delete
  end

  private

  def setup
    @user = current_user
    @friend = params.find(params[:id])
  end
end
