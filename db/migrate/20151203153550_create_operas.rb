class CreateOperas < ActiveRecord::Migration
  def change
    create_table :operas do |t|
      t.text :name
      t.date :year
      t.integer :archive_index
      t.integer :website_id
      t.attachment :image

      t.timestamps null: false
    end
  end
end
