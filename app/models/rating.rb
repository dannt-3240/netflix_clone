# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  movie_id   :bigint
#  user_id    :bigint
#  value      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Rating < ApplicationRecord
end
