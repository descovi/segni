class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :name
      t.string :name-slug
      t.string :primary_color
      t.string :secondary_color

      t.timestamps null: false
    end
  end
end
