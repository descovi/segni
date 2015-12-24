class ChangeTypeForIpColumn < ActiveRecord::Migration
  def change
    change_column :orders, :ip, :string
  end
end
