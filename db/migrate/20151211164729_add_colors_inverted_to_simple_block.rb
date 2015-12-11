class AddColorsInvertedToSimpleBlock < ActiveRecord::Migration
  def change
    add_column :simple_blocks, :colors_inverted, :boolean
  end
end
