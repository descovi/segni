class CreateSimpleBlock < ActiveRecord::Migration
  def change
    create_table :simple_blocks do |t|
      t.references :page, index: true, foreign_key: true
      t.attachment :background_image
      t.text :title
      t.text :content
      t.text :action  
    end
  end
end
