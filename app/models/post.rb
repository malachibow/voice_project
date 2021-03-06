class Post < ApplicationRecord
  belongs_to :user
  has_many :saved_posts
  has_and_belongs_to_many :followers


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
