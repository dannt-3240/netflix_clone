# == Schema Information
#
# Table name: movie_directors
#
#  id                :bigint           not null, primary key
#  directorable_type :string(255)
#  directorable_id   :bigint
#  director_id       :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class MovieDirector < ApplicationRecord
  belongs_to :directorable, polymorphic: true
  belongs_to :director
end
