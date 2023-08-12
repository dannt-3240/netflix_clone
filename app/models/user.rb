class User < ApplicationRecord
  has_many :lists
  has_many :reviews
  has_many :ratings
  has_many :user_movie_watchlists
end
