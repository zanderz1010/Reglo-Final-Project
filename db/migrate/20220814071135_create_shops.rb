class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :website
      t.string :location
      t.string :name_of_shop
      t.integer :where_to_buys_count

      t.timestamps
    end
  end
end
