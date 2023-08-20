# == Schema Information
#
# Table name: lists
#
#  id          :bigint           not null, primary key
#  user_id     :bigint
#  name        :string(255)
#  description :string(255)
#  image       :string(255)
#  order       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class List < ApplicationRecord
    belongs_to :user 
    has_many :list_items
end
