# == Schema Information
#
# Table name: ratings
#
#  id              :bigint           not null, primary key
#  ratingable_type :string(255)
#  ratingable_id   :bigint
#  user_id         :bigint
#  value           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Rating < ApplicationRecord
  belongs_to :ratingable
  belongs_to :user
end
