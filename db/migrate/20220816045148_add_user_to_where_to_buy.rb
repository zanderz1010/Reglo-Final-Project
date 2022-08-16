class AddUserToWhereToBuy < ActiveRecord::Migration[6.0]
  def change


    add_column :where_to_buys, :user_where_id, :integer


  end
end
