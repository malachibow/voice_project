class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: { message: "Must enter a header." }
  validates :stand, presence: { message: "Must enter a stand." }
  validates :why, presence: { message: "Must enter a why." }
end
