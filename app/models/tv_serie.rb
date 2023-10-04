# == Schema Information
#
# Table name: tv_series
#
#  id           :bigint           not null, primary key
#  name         :string(255)
#  description  :string(255)
#  imdb         :float(24)
#  rating       :float(24)        default(0.0)
#  liked        :integer          default(0)
#  watched      :integer          default(0)
#  duration     :integer
#  release_year :integer
#  rank         :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class TvSerie < ApplicationRecord
  include Searchable
  has_many :castings, as: :castingable
  has_many :list_items, as: :listable
  has_many :reviews, as: :reviewable
  has_many :user_movie_watchlists, as: :watchlistable
  has_many :movie_genres, as: :genreable
  has_many :ratings, as: :ratingable
  has_many :movie_countries, as: :countryable
  has_many :movie_directors, as: :directorable
  has_many :movie_productions, as: :productionable
  has_many :tv_episodes

  has_many :genres, through: :movie_genres
  has_many :actors, through: :castings
  has_many :countries, through: :movie_countries
  has_many :directors, through: :movie_directors
  has_many :productions, through: :movie_productions

  has_one_attached :poster
  has_one_attached :thumbnail

  accepts_nested_attributes_for :tv_episodes
end
