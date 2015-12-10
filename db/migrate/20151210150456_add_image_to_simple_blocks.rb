class AddImageToSimpleBlocks < ActiveRecord::Migration
  def up
    add_attachment :simple_blocks, :image_1
    add_attachment :simple_blocks, :image_2
    add_attachment :simple_blocks, :image_3
    add_attachment :simple_blocks, :image_4
    add_attachment :simple_blocks, :image_5
    add_attachment :simple_blocks, :image_6
  end

  def down
    remove_attachment :simple_blocks, :image_1
    remove_attachment :simple_blocks, :image_2
    remove_attachment :simple_blocks, :image_3
    remove_attachment :simple_blocks, :image_4
    remove_attachment :simple_blocks, :image_5
    remove_attachment :simple_blocks, :image_6
  end
end
