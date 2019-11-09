class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :title, :display_name
    rename_column :items, :number, :quantity
    rename_column :items, :content, :item_explain
  end
end
