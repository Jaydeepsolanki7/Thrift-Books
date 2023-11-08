class AddRemainingBooksToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :remaining_books, :integer
  end
end
