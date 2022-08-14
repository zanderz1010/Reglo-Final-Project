class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.float :price
      t.string :status_of_gift
      t.text :description
      t.integer :category_id
      t.string :name_of_gift
      t.integer :requester_id
      t.integer :buyer_id
      t.integer :where_to_buys_count

      t.timestamps
    end
  end
end
