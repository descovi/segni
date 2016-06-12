class AddDescriptionToOpera < ActiveRecord::Migration
  def up
    Opera.add_translation_fields!({name: :text},{migrate_data: true})
    Opera.add_translation_fields! description: :text
    remove_column :opera_translations, :title
  end
  def down
    remove_column :opera_translations, :description
    remove_column :opera_translations, :name
  end
end
