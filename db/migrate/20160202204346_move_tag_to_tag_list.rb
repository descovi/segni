class MoveTagToTagList < ActiveRecord::Migration
  def change
    Opera.all.each do |opera|
      opera.tag_list.add(opera.tag_1)
      opera.tag_list.add(opera.tag_2)
      opera.tag_list.add(opera.tag_3)
      opera.save
    end
  end
end
