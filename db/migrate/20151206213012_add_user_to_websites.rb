class AddUserToWebsites < ActiveRecord::Migration
  def change
    add_reference :websites, :user, index: true, foreign_key: true
  end
end
