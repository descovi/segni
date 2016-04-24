class AddSlidingFullScreenToSimpleBlock < ActiveRecord::Migration
  def change
    add_column :simple_blocks, :sliding_full_screen, :boolean
    add_column :simple_blocks, :sliding_full_screen_margin_bottom, :integer
  end
end
