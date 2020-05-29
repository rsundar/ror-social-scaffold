module FriendshipsHelper

  def friendship_requested?(user, friend)
    friendship = Friendship.find_by_user_id_and_friend_id(user, friend)
    friendship.status == 'requested'
  end

  def friendship_pending?(user, friend)
    friendship = Friendship.find_by_user_id_and_friend_id(user, friend)
    friendship.status == 'pending'
  end

  def friendship_buttons(user, friend)
    return if user == friend

    unless Friendship.exists?(user, friend)
      return button_to "Send friend request", friendships_path, params: { id: friend.id }, method: :post, class: ' btn-primary'
    end

    friendship = Friendship.find_by_user_id_and_friend_id(user, friend)
    case friendship
    when friendship.status == 'requested'
      button_to "Confirm friendship", accept_path, params: { id: friend.id }, method: :patch, class: '  btn-primary'
      button_to "Decline friendship", decline_path, params: { id: friend.id }, method: :delete, class: '  btn-primary'
    when friendship.status == 'pending'
      button_to "Cancel friend request", cancel_path, params: { id: friend.id }, method: :delete, class: '  btn-primary'
    when friendship.status == 'accepted'
      button_to "Remove friendship", delete_path, params: { id: friend.id }, method: :delete, class: ' btn-primary'
    end

      

  end
end
