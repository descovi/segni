class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :name
      t.string :url
      t.attachment :background_image
      t.integer :simple_block_id
    end
  end
end
