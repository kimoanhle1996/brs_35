class User < ApplicationRecord
  attr_accessor :remember_token
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
  before_save { self.email = email.downcase }
  validates :fullname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def self.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
