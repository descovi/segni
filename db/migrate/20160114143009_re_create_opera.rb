class ReCreateOpera < ActiveRecord::Migration
  def change
    create_table :operas do |t|
      t.text :name
      t.date :year
      t.integer :archive_index
      t.integer :website_id
      t.attachment :image

      t.timestamps null: false
    end

    remove_column :products, :year
    remove_column :products, :archive_index
  end
end
