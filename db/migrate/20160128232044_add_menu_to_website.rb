class AddMenuToWebsite < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :url
      t.integer :position
    end
  end
end
