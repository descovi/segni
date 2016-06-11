class RemoveColumnNameFromMenu < ActiveRecord::Migration
  def change
    remove_column :menus, :name
  end
end
