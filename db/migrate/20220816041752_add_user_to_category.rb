class AddUserToCategory < ActiveRecord::Migration[6.0]
  def change

    add_column :categories, :user_category_id, :integer

  end
end
