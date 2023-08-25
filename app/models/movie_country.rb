# == Schema Information
#
# Table name: movie_countries
#
#  id               :bigint           not null, primary key
#  countryable_type :string(255)
#  countryable_id   :bigint
#  country_id       :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class MovieCountry < ApplicationRecord
  belongs_to :countryable, polymorphic: true
  belongs_to :country
end
