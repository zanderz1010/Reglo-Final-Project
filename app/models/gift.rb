# == Schema Information
#
# Table name: gifts
#
#  id                  :integer          not null, primary key
#  description         :text
#  name_of_gift        :string
#  price               :float
#  status_of_gift      :string
#  where_to_buys_count :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  buyer_id            :integer
#  category_id         :integer
#  requester_id        :integer
#
class Gift < ApplicationRecord


  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "requester_id", :counter_cache => :requested_gifts_count })
  belongs_to(:buyer, { :class_name => "User", :foreign_key => "buyer_id", :counter_cache => :bought_gifts_count })
  has_many(:where_to_buys, { :class_name => "WhereToBuy", :foreign_key => "gift_id", :dependent => :destroy })
  belongs_to(:category, { :required => true, :class_name => "Category", :foreign_key => "category_id", :counter_cache => true })

  has_many(:shops, { :through => :where_to_buys, :source => :shop })



end
