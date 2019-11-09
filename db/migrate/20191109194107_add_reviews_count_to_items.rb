class AddReviewsCountToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :reviews_count, :integer, default: 0
  end
end
