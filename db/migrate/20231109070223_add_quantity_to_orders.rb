class AddQuantityToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :quantity, :integer
  end
end
