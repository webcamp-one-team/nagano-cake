class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :member_id
      t.integer :item_id
      t.integer :amount, default: 1

      t.timestamps
    end
  end
end
