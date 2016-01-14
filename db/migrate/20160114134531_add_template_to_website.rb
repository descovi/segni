class AddTemplateToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :template_id, :integer
  end
end
