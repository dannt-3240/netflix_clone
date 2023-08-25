# == Schema Information
#
# Table name: movie_productions
#
#  id                  :bigint           not null, primary key
#  productionable_type :string(255)
#  productionable_id   :bigint
#  production_id       :bigint
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class MovieProduction < ApplicationRecord
  belongs_to :productionable, polymorphic: true
  belongs_to :production
end
