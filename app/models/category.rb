# == Schema Information
#
# Table name: categories
#
#  id               :integer          not null, primary key
#  gifts_count      :integer
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_category_id :integer
#
class Category < ApplicationRecord


  has_many(:gifts, { :class_name => "Gift", :foreign_key => "category_id", :dependent => :nullify })
  belongs_to(:user_category, { :required => true, :class_name => "User", :foreign_key => "user_category_id" })


end
