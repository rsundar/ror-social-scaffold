module FriendshipsHelper
  # Return true if a friendship has been requested.

  def friendship_requested?(user, friend)
    friendship = Friendship.find_by_user_id_and_friend_id(user, friend)
    friendship.status == 'requested'
  end

  # Return true if a friendship is pending

  def friendship_pending?(user, friend)
    friendship = Friendship.find_by_user_id_and_friend_id(user, friend)
    friendship.status == 'pending'
  end
end
