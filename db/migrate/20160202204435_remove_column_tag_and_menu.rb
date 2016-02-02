class RemoveColumnTagAndMenu < ActiveRecord::Migration
  def change
    remove_column :operas, :tag_1, :text
    remove_column :operas, :tag_2, :text
    remove_column :operas, :tag_3, :text
  end
end
