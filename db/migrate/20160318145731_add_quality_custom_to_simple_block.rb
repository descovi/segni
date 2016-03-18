class AddQualityCustomToSimpleBlock < ActiveRecord::Migration
  def change
    add_column :simple_blocks, :quality, :text
  end
end
