class ChangeCartIndex < ActiveRecord::Migration[5.2]
  def change
    remove_index :carts, [:user_id, :item_id]
    add_index :carts, [:user_id, :item_id]
  end
end
