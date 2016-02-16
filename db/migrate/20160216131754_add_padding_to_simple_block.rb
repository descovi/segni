class AddPaddingToSimpleBlock < ActiveRecord::Migration
  def change
    add_column :simple_blocks, :padding, :integer
  end
end
