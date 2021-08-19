class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.date :delivery_date
      t.text :product_id
      t.string :payment_option
      t.integer :amount
      t.string :order_status

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
