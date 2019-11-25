class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
      
    end

  add_index :carts, [:user_id, :item_id], unique: true
  end
end