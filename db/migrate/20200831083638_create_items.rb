class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.string :img_id
      t.text :detail
      t.integer :price
      t.boolean :is_active, default: true, null: false

      t.timestamps
    end
  end
end
