# == Schema Information
#
# Table name: movie_genres
#
#  id         :bigint           not null, primary key
#  movie_id   :bigint
#  genre_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MovieGenre < ApplicationRecord
end
