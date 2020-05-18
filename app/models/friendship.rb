class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: :friend_id

  validates_presence_of :user_id, :friend_id

  # Return true if the users are (possibly pending) friends.

  def self.exists?(user, friend)
    !Friendship.find_by_user_id_and_friend_id(user, friend).nil?
  end

  # Record a pending friend request.

  def self.request(user, friend)
    unless user == friend || Friendship.exists?(user, friend)
      Friendship.transaction do
        Friendship.create(user: user, friend: friend, status: 'pending')
        Friendship.create(user: friend, friend: user, status: 'requested')
      end
    end
  end

  # Accept a friend request.

  def self.accept(user, friend)
    Friendship.transaction do
      accepted_at = Time.now
      accept_one_side(user, friend, accepted_at)
      accept_one_side(friend, user, accepted_at)
    end
  end

  private

    # Update the database with one side of an accepted friendship request.

    def self.accept_one_side(user, friend, accepted_at)
      request = Friendship.find_by_user_id_and_friend_id(user, friend)
      request.status = 'accepted'
      request.accepted_at = accepted_at
      request.save!
    end
end
