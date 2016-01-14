class AddDescriptionToOpera2 < ActiveRecord::Migration
  def change
    add_column :operas, :description, :text
  end
end
