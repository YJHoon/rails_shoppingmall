class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :title,               null: false, default: ""
      t.string :content,             null: false, default: ""
      t.integer :price,              null: false, default: 0
      t.timestamps
    end
  end
end
