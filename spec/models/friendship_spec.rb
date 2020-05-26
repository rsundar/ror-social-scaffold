require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before(:each) do
    @user = create(:user) 
    @friend =  create(:user)
  end
  

  describe "#request" do
    it "creates two records for a mutual friendship" do
      Friendship.request(@user, @friend)
      friendship_pending = Friendship.exists?(@user, @friend)
      friendship_requested = Friendship.exists?(@friend, @user)

      expect(friendship_pending && friendship_requested).to be(true)
    end
  end
end
