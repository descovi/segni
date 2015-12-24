class AddPurchasedAtToShoppingCarts < ActiveRecord::Migration
  def change
    add_column :orders, :purchased_at, :date
  end
end
