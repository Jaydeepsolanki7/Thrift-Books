class Category < ApplicationRecord
  validates :name, presence: true
  has_many :books
  has_one_attached :cat_image
end
