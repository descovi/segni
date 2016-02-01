class AddWebsiteIdToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :website_id, :integer
  end
end
