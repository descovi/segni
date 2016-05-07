class CreateImagesOperas < ActiveRecord::Migration
  def change
    create_table :images_operas, id: false do |t|
      t.belongs_to :images, index: true
      t.belongs_to :operas, index: true
    end
  end
end
