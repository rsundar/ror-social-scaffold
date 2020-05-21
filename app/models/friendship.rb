class Friendship < ApplicationRecord
    belongs_to :user,
    belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'
    
    validates_presence_of :user_id, :friend_id

    def self.exists? (user, friend)
        !find_by_user_id_and_friend_id(user, friend).nil?
    end

    def self.request(user, friend)
        unless user == friend || Friendship.exists?(user, friend)
            Friendship.transaction do
                Friendship.create(user: user, friend: friend, status: 'pending')
                Friendship.create(user: friend, friend: user, status: 'requested')
            end
        end
    end

    private
    
    def self.accept_one_side(user, friend, accepted_at)
        request = find_by_user_id_and_friend_id(user, friend)
        request.status = 'accepted'
        request.accepted_at = accepted_at
        request.save!
    end
end
