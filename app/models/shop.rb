# == Schema Information
#
# Table name: shops
#
#  id                  :integer          not null, primary key
#  location            :string
#  name_of_shop        :string
#  website             :string
#  where_to_buys_count :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Shop < ApplicationRecord


  has_many(:where_to_buys, { :class_name => "WhereToBuy", :foreign_key => "shop_id", :dependent => :destroy })

  has_many(:gifts, { :through => :where_to_buys, :source => :gift })


end
