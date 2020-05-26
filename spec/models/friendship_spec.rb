require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before(:each) do
    @user = create(:user) 
    @friend =  create(:user)
  end
  

  describe ".request" do
    before(:each) do 
      Friendship.request(@user, @friend)
      @pending_friendship = Friendship.find_by_user_id_and_friend_id(@user, @friend)
      @requested_friendship = Friendship.find_by_user_id_and_friend_id(@friend, @user)
    end 
    
    it "creates 2 records in db for mutual friendship" do
  
      expect(@pending_friendship).not_to be nil
      expect(@requested_friendship).not_to be nil     
    end

    it "set status attribute of one record to 'pending' " do

      expect(@pending_friendship.status).to eq "pending"
    end

    it "set status attribute of one record to 'requested' " do

      expect(@requested_friendship.status).to eq "requested"
    end
  end

  describe ".accept" do
    before(:each) do
      Friendship.request(@user, @friend)
      Friendship.accept(@user, @friend)
      @friendship1 = Friendship.find_by_user_id_and_friend_id(@user, @friend)
      @friendship2 = Friendship.find_by_user_id_and_friend_id(@friend, @user)
    end
    
    it "updates the status attribute of a pending friendship to 'accepted'" do

      expect(@friendship1.status).to eq "accepted"      
    end

    it "updates the status attribute of a requested friendship to 'accepted'" do

      expect(@friendship2.status).to eq "accepted"      
    end

  end

  
end
