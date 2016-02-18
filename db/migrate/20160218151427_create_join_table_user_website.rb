class CreateJoinTableUserWebsite < ActiveRecord::Migration
  def change
    create_join_table :users, :websites do |t|
      t.index [:user_id, :website_id]
      t.index [:website_id, :user_id]
    end
  end
end
