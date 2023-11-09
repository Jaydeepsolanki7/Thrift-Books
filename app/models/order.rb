class Order < ApplicationRecord
  belongs_to :user
  enum :status, [:pending, :shipped, :being_packed, :complete, :cancelled]
  has_many :book_orders
  has_many :books, through: :book_orders
  accepts_nested_attributes_for :book_orders, reject_if: :all_blank, allow_destroy: true

  before_create :set_default_status
  def set_default_status
    self.status ||= :pending
  end
end
