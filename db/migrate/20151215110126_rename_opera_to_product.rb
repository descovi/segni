class RenameOperaToProduct < ActiveRecord::Migration
  def change
   rename_table :operas, :products
  end
end
