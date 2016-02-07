class AddCssAndJsCustomToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :css, :text
    add_column :websites, :js, :text
  end
end
