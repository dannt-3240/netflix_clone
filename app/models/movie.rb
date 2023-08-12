class Movie < ApplicationRecord
    has_many :list_items
    has_many :reviews
    has_many :ratings
    has_many :castings
    has_many :user_movie_watchlists
    has_many :genres
end
