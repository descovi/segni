class AddUserAndWebsiteToImage < ActiveRecord::Migration
  def change
    add_column :images, :website_id, :integer
  end
end
