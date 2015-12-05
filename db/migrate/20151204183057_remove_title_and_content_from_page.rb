class RemoveTitleAndContentFromPage < ActiveRecord::Migration
  def change
    remove_column :pages, :title
    remove_column :pages, :content
  end
end
