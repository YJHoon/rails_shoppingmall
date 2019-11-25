class AddColumnToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :cart_item_quantity, :integer, default:1
    add_column :carts, :cart_item_name, :string
  end
end
