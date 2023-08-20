# == Schema Information
#
# Table name: user_movie_watchlists
#
#  id             :bigint           not null, primary key
#  movie_id       :bigint
#  user_id        :bigint
#  duration_watch :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class UserMovieWatchlist < ApplicationRecord
    belongs_to :movie
    belongs_to :user
end
