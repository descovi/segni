class AddHorizontalVerticalSpaceToOpera < ActiveRecord::Migration
  def change
    add_column :operas, :horizontal_space, :integer, default: 1
    add_column :operas, :vertical_space, :integer, default: 1
  end
end
