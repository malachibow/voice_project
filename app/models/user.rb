class User < ApplicationRecord
  before_create :set_username

  has_many :topics
  has_many :replies
  has_many :posts
  has_many :saved_posts
  has_many :followers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  private
  def set_username
    self.username = "@#{ SecureRandom.hex(7)}"
  end
end
