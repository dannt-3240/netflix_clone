# == Schema Information
#
# Table name: genres
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Genre < ApplicationRecord
    belongs_to :movie
end
