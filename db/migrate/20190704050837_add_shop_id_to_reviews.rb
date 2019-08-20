class AddShopIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :shop_id, :integer
  end
end
