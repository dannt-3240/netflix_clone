# == Schema Information
#
# Table name: list_items
#
#  id            :bigint           not null, primary key
#  list_id       :bigint
#  itemable_type :string(255)
#  itemable_id   :bigint
#  order         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class ListItem < ApplicationRecord
  belongs_to :itemable, polymorphic: true
  belongs_to :list
end
