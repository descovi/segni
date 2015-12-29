class AddMenuTitleToBlock < ActiveRecord::Migration
  def change
    add_column :simple_blocks, :menu_title, :text
  end
end
