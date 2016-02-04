class AddSimpleBlockIdToImage < ActiveRecord::Migration
  def change
    add_column :images, :simple_block_id, :integer
  end
end
