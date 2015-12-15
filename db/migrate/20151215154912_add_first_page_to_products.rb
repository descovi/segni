class AddFirstPageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :first_page, :boolean
  end
end
