class AddIdToOperaImages < ActiveRecord::Migration
  def change
    add_column :images_operas, :id, :primary_key
  end
end
