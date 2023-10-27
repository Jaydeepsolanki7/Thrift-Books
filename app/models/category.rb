class Category < ApplicationRecord
<<<<<<< HEAD
  validates :name, presence: true
=======
  has_many :books
>>>>>>> adding-book-model
end
