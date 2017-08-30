class User < ApplicationRecord
  has_many :read_books
  has_many :requests
  has_many :ratings
  has_many :comments
  has_many :reviews
  has_many :likes
  has_many :Create_follows, class_name: Follow.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :following, through: :active_follows, source: :followed
  has_many :passive_relationships, class_name: Follow.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :passive_follows, source: :follower
end
