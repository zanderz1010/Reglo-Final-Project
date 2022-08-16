# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  bio                   :string
#  bought_gifts_count    :integer
#  email                 :string
#  first_name            :string
#  last_name             :string
#  password_digest       :string
#  profile_image         :string
#  requested_gifts_count :integer
#  shareable_tag         :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password



  has_many(:requested_gifts, { :class_name => "Gift", :foreign_key => "requester_id", :dependent => :destroy })
  has_many(:bought_gifts, { :class_name => "Gift", :foreign_key => "buyer_id", :dependent => :nullify })
  has_many(:categories, { :class_name => "Category", :foreign_key => "user_category_id", :dependent => :destroy })
  has_many(:shops, { :class_name => "Shop", :foreign_key => "user_shop_id", :dependent => :destroy })
  has_many(:where_to_buys, { :class_name => "WhereToBuy", :foreign_key => "user_where_id", :dependent => :destroy })

end
