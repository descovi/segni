class AddPriceCentsToProduct < ActiveRecord::Migration
  def change
    rename_column :products, :price, :price_label
  end
end
