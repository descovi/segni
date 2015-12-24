class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :shopping_cart_id
      t.integer :ip
      t.string :express_token
      t.string :express_payer_id
    end
  end
end
