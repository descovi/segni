class RenameTableImagesOperas < ActiveRecord::Migration
  def change
        rename_table :images_operas, :images_opera

  end
end
