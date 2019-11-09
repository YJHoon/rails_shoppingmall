class AddNumbertoItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :itemname, :string, default:"", null:false
    add_column :items, :number, :integer, default:1
  end
end
