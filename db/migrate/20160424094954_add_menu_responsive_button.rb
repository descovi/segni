class AddMenuResponsiveButton < ActiveRecord::Migration
  def change
    add_column :websites, :button_open_menu, :boolean
  end
end
