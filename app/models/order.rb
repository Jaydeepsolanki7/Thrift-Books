class Order < ApplicationRecord
  belongs_to :user
  enum :status, [:shipped, :being_packed, :complete, :cancelled]
  has_many :book_orders, dependent: :destroy
  has_many :books, through: :book_orders
  accepts_nested_attributes_for :book_orders, reject_if: :all_blank, allow_destroy: true

  before_create :set_default_status
  def set_default_status
    self.status ||= :shipped
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "status", "updated_at", "user_id"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    ["book_orders", "books", "user"]
  end
end
