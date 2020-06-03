require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  context "tests for user friendship scopes" do
    let!(:user) { create(:user) }
    let!(:other_user) { create(:user) }

    describe ":pending_friends scope" do
      it "includes friends that have a pending friendship status" do
        Friendship.request(user, other_user)
        expect(user.pending_friends.include?(other_user)).to be true
      end
    end

    describe ":requested_friends scope" do
      it "includes friends that have requested friendship status" do
        Friendship.request(user, other_user)
        expect(other_user.requested_friends.include?(user)).to be true
      end
    end

    describe ":friends scope" do
      it "includes friends that have accepted a friendship" do
        Friendship.request(user, other_user)
        Friendship.accept(user, other_user)
        expect(user.friends.include?(other_user)).to be true
        expect(other_user.friends.include?(user)).to be true
      end
    end
  end
end
