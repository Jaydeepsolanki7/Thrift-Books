class BookOrder < ApplicationRecord
  belongs_to :book
  belongs_to :order

  after_create :update_remaining_book_count

  def update_remaining_book_count
    self.book.update(remaining_books: book.remaining_books - quantity)
  end
end
