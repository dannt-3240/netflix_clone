# == Schema Information
#
# Table name: actors
#
#  id          :bigint           not null, primary key
#  name        :string(255)
#  description :string(255)
#  address     :string(255)
#  birthday    :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Actor < ApplicationRecord
    has_many :castings
end
