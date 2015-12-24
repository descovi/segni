class AddStuffToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :address, :string
    #add_column :orders, :contact_phone, :string
    add_column :orders, :details, :string
    add_column :orders, :email, :string
    add_column :orders, :info, :string
    add_column :orders, :name, :string
    add_column :orders, :note, :string
    add_column :orders, :payer_country, :string
    add_column :orders, :shipping, :string
    
  end
end
