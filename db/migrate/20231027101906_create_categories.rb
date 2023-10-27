class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :cat_image

      t.timestamps
    end
  end
end
