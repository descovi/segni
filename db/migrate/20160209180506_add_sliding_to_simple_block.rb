class AddSlidingToSimpleBlock < ActiveRecord::Migration
  def change
    add_column :simple_blocks, :sliding, :boolean
  end
end
