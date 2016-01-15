class AddTechicalSkill < ActiveRecord::Migration
  def change
      add_column :operas, :tecnical, :text
      add_column :operas, :size, :text
      add_column :operas, :surface_id, :integer
      add_column :operas, :subject_id, :integer
      add_column :operas, :circa_date, :boolean
      add_column :operas, :tag_1, :text
      add_column :operas, :tag_2, :text
      add_column :operas, :tag_3, :text
      #Opera.create_translation_table! :title => :string, :description => :text
      
      create_table :surfaces do |t|
        t.text :name
      end


      create_table :subjects do |t|
        t.text :name
      end


  end
end
