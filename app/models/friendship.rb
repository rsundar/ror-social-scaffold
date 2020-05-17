class Friendship < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

  scope :confirmed, -> { where('status=?', 'Accepted') }
  scope :pending, -> { where('status=?', 'Pending') }
  scope :rejected, -> { where('status=?', 'Rejected') }
end
