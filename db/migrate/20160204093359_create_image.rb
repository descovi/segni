class CreateImage < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :url
    end
  end
end
