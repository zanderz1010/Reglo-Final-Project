# == Schema Information
#
# Table name: where_to_buys
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  gift_id       :integer
#  shop_id       :integer
#  user_where_id :integer
#
class WhereToBuy < ApplicationRecord

  belongs_to(:gift, { :class_name => "Gift", :foreign_key => "gift_id", :counter_cache => true })
  belongs_to(:shop, { :required => true, :class_name => "Shop", :foreign_key => "shop_id", :counter_cache => true })
  belongs_to(:user_where, { :required => true, :class_name => "User", :foreign_key => "user_where_id" })

end
