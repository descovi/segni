class RemoveColumnMarginFromSimpleBlock < ActiveRecord::Migration
  def change
    remove_column :simple_blocks, :margin
  end
end
