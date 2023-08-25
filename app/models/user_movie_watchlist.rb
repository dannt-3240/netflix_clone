# == Schema Information
#
# Table name: user_movie_watchlists
#
#  id                 :bigint           not null, primary key
#  watchlistable_type :string(255)
#  watchlistable_id   :bigint
#  user_id            :bigint
#  duration_watch     :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class UserMovieWatchlist < ApplicationRecord
    belongs_to :watchlistable
    belongs_to :user
end
