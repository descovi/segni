class RenameColumnImagesOperas < ActiveRecord::Migration
  def change
    rename_column :images_operas, :images_id, :image_id
    rename_column :images_operas, :operas_id, :opera_id

  end
end
