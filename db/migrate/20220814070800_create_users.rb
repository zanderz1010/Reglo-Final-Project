class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :shareable_tag
      t.string :bio
      t.string :profile_image
      t.integer :requested_gifts_count
      t.integer :bought_gifts_count

      t.timestamps
    end
  end
end
