class FixColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :display_name, :string,  null: true, default: nil
    change_column :items, :item_explain, :string, null: true, default: nil
    change_column :items, :itemname, :string, null: true, default: nil
  end
end
