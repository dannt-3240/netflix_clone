# == Schema Information
#
# Table name: reviews
#
#  id              :bigint           not null, primary key
#  reviewable_type :string(255)
#  reviewable_id   :bigint
#  user_id         :bigint
#  title           :string(255)
#  text            :string(255)
#  post_date       :date
#  liked           :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Review < ApplicationRecord
    belongs_to :reviewable
    belongs_to :user
end
