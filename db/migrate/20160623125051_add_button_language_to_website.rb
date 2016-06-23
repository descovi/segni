class AddButtonLanguageToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :button_language, :boolean
  end
end
