class FriendshipController < ApplicationController
  before_action :setup
  
  def create

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
