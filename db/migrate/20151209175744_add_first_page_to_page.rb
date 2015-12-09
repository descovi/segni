class AddFirstPageToPage < ActiveRecord::Migration
  def change
    add_column :websites, :first_page_id, :integer
  end
end
