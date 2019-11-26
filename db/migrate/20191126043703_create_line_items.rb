class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :order, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity, default: 1
      t.integer :unit_price, default: 0
      t.integer :total, default: 0

      t.timestamps
    end
  end
end
