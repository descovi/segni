class AddTranslation < ActiveRecord::Migration
  def up
    Page.create_translation_table! :title => :string, :content => :text
  end
  def down
    Page.drop_translation_table!
  end
end
