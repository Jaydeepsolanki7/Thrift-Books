class Book < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_one_attached :cover_image
end
