class Book < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :reviews
  has_one_attached :cover_image
  has_many_attached :pages


  def self.ransackable_attributes(auth_object = nil)
    ["author_id", "availability", "category_id", "cover_image", "created_at", "description", "id", "id_value", "price", "quantity", "rating", "title", "updated_at"]
  end
end
