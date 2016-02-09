class AddContainerFluidToSimpleBlocks < ActiveRecord::Migration
  def change
    add_column :simple_blocks, :container_fluid, :boolean
    add_column :simple_blocks, :margin, :integer
    add_column :simple_blocks, :num_elements, :integer
  end
end
