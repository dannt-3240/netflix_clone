# == Schema Information
#
# Table name: movie_genres
#
#  id             :bigint           not null, primary key
#  genreable_type :string(255)
#  genreable_id   :bigint
#  genre_id       :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class MovieGenre < ApplicationRecord
  belongs_to :genreable, polymorphic: true
  belongs_to :genre
end
