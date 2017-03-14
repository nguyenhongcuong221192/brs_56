class User < ApplicationRecord

  has_many :reviews
  has_many :comments
  has_many :requests
  has_many :ratings
  has_many :historys
  has_many :marks
  has_many :likes

  has_many :active_relationships, class_name:  Relationship.name,
    foreign_key: "follower_id",dependent:   :destroy
  has_many :passive_relationships, class_name:  Relationship.name,
    foreign_key: "followed_id",dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  scope :order_by_date, ->{order(created_at: :desc)}

  attr_accessor :remember_token
  before_save {self.email = email.downcase}
  validates :name, presence: true, length: {maximum: Settings.maximum_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.maximum_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.minimum_password},
    allow_nil: true

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end
  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute :remember_digest, nil
  end
end
