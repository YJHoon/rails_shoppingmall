class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :state
      t.string :order_number
      t.integer :total, default: 0
      t.integer :shipping_fee, default: 0
      t.string :orderer
      t.string :phone
      t.string :zipcode
      t.string :address1
      t.string :address2
      t.string :shipping_msg
      t.datetime :paid_at
      t.datetime :cancelled_at

      t.timestamps
    end
  end
end
