require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  context "tests for friendship scopes" do
    let!(:user) { create(:user) }
    let!(:friend) { create(:user) }

    describe ":pending_friends scope" do
      it "includes friends that have a pending friendship status" do
        Friendship.request(user, friend)
        expect(user.pending_friends.include?(friend)).to be true
      end
    end

    describe ":requested_friends scope" do
      it "includes friends that have requested friendship status" do
        Friendship.request(user, friend)
        expect(friend.requested_friends.include?(user)).to be true
      end
    end
  end

end
