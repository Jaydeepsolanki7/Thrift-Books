class BookOrder < ApplicationRecord
  belongs_to :book
  belongs_to :order, optional: true
  after_create :update_remaining_book

  def update_remaining_book
    
  end

  def self.ransackable_attributes(auth_object = nil)
    ["book_id", "created_at", "id", "id_value", "order_id", "quantity", "updated_at"]
  end
end
