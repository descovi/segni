class AddPositionToSimpleBlock < ActiveRecord::Migration
  def change
    add_column :simple_blocks, :position, :integer
  end
end
