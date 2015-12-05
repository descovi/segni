class AddSlugToTranslation < ActiveRecord::Migration
  def change
    add_column :page_translations, :slug, :string
  end
end
