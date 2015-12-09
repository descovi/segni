class AddTranslationToSimpleBlocks < ActiveRecord::Migration
  def up
    fields = {:title => :text, :content => :text, :action => :text}
    SimpleBlock.create_translation_table!(fields)
  end
  def down
    SimpleBlock.drop_translation_table!
  end
end
