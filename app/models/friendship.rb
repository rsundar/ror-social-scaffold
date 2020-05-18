class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: :friend_id

  validates_presence_of :user_id, :friend_id

  # Return true if the users are (possibly pending) friends.

  def self.exists?(user, friend)
    !Friendship.find_by_user_id_and_friend_id(user, friend).nil?
  end

  
end
