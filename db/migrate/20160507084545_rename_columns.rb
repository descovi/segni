class RenameColumns < ActiveRecord::Migration
  def change
    rename_column :operas, :image_file_name, :image_paper_file_name
    rename_column :operas, :image_file_size, :image_paper_file_size
    rename_column :operas, :image_content_type, :image_paper_content_type
    rename_column :operas, :image_updated_at, :image_paper_updated_at
  end
end
