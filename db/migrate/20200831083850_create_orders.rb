class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :payment_method
      t.integer :order_status
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :deliver_charge
      t.integer :total_payment

      t.timestamps
    end
  end
end
