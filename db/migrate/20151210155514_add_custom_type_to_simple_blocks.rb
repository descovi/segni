class AddCustomTypeToSimpleBlocks < ActiveRecord::Migration
  def change
    add_column :simple_blocks, :custom_type, :string
  end
end
