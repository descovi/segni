class AddFullHeightToSimpleBlock < ActiveRecord::Migration
  def change
    add_column :simple_blocks, :full_height, :boolean
    add_column :simple_blocks, :background_color, :boolean
  end
end
