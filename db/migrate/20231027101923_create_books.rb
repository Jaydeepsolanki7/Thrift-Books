class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :cover_image
      t.boolean :availability
      t.float :rating
      t.integer :quantity
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
