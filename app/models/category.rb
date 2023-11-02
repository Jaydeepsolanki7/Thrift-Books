class Category < ApplicationRecord
  validates :name, presence: true
  has_many :books
  has_one_attached :cat_image
  def self.ransackable_attributes(auth_object = nil)
    ["cat_image", "created_at", "id", "id_value", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["books", "cat_image_attachment", "cat_image_blob"]
  end
end
