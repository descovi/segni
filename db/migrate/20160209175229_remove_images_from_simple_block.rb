class RemoveImagesFromSimpleBlock < ActiveRecord::Migration
  def change
    remove_column :simple_blocks, :image_1
    remove_column :simple_blocks, :image_2
    remove_column :simple_blocks, :image_3

    remove_column :simple_blocks, :image_4
    remove_column :simple_blocks, :image_5
    remove_column :simple_blocks, :image_6
  end
end
