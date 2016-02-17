class AddHeadToWebsites < ActiveRecord::Migration
  def change
    add_column :websites, :head, :text
  end
end
