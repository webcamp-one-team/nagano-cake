class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :payment_method, default:0
      t.integer :order_status, default:0
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :deliver_charge, default:800
      t.integer :total_payment

      t.timestamps
    end
  end
end
