class AddTranslationTableToOpera < ActiveRecord::Migration
  def up
    Opera.create_translation_table! title: :string
    Subject.create_translation_table! name: :string
    Surface.create_translation_table! name: :string
  end

  def down
    Opera.drop_translation_table!
    Subject.drop_translation_table!
    Surface.drop_translation_table!
  end
end
