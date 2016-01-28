class AddCoverSliderToOpera < ActiveRecord::Migration
  def change
    add_column :operas, :cover_slider, :boolean
  end
end
