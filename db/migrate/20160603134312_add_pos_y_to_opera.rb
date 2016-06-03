class AddPosYToOpera < ActiveRecord::Migration
  def change
    add_column :operas, :pos_y, :integer, default: 50
  end
end
