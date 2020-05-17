class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships, dependent: :destroy
  
  def confirmed_friends
    Friendship.created_by(self).confirmed
  end

  def pending
    Friendship.created_by(self).pending
  end

  def rejected
    Friendship.created_by(self).rejected
  end

  def received_requests
    User.joins(:friendships).merge(Friendship.sent_to(self).pending)
  end
end
