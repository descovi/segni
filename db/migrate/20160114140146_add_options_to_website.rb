class AddOptionsToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :product, :boolean
    add_column :websites, :opera, :boolean
  end
end
