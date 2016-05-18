class AddOperaIdToImages < ActiveRecord::Migration
  def change
    add_reference :images, :opera, index: true, foreign_key: true
  end
end
