class Post < ApplicationRecord
  belongs_to :user
  has_many :saves
  has_and_belongs_to_many :followers

  validates :title, presence: { message: "Must enter a header." }

  scope :published, -> {
          where("publish = ?", true)
        }
  scope :original, -> {
          where("original = ?", true)
        }
  scope :random, -> {
          order("RANDOM()").limit(1)
        }
end
