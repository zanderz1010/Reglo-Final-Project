class AddUserToShop < ActiveRecord::Migration[6.0]
  def change

    add_column :shops, :user_shop_id, :integer

  end
end
