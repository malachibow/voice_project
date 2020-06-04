class User < ApplicationRecord
  before_create :set_username

  has_many :topics
  has_many :replies
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  private
  def set_username
    self.username = "@#{ SecureRandom.hex(20)}"
  end
end
