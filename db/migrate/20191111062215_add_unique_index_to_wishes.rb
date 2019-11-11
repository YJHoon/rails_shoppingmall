class AddUniqueIndexToWishes < ActiveRecord::Migration[5.2]
  def change
    add_index :wishes, [:user_id, :item_id], unique: true
  end
end
