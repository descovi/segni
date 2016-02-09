class RemoveColumnsOfImage1to6 < ActiveRecord::Migration
  def change
    [1,2,3,4,5,6].each do |element| 
      remove_column :simple_blocks, "image_#{element}_file_name".to_sym
      remove_column :simple_blocks, "image_#{element}_content_type".to_sym
      remove_column :simple_blocks, "image_#{element}_file_size".to_sym
      remove_column :simple_blocks, "image_#{element}_updated_at".to_sym
    end
  end
end
