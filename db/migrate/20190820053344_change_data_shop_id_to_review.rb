class ChangeDataShopIdToReview < ActiveRecord::Migration[5.1]
  def change
  	change_column :reviews, :shop_id, :string
  end
end
