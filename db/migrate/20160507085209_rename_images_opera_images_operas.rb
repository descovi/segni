class RenameImagesOperaImagesOperas < ActiveRecord::Migration
  def change
            rename_table :images_opera, :images_operas
  end
end
