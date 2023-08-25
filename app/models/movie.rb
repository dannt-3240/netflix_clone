# == Schema Information
#
# Table name: movies
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
class Movie < ApplicationRecord
  enum movie_type: {single_movie: 0, tv_series: 1}

  has_many :castings, as: :castingable
  has_many :list_items, as: :listable
  has_many :reviews, as: :reviewable
  has_many :user_movie_watchlists, as: :watchlistable
  has_many :movie_genres, as: :genreable
  has_many :ratings, as: :ratingable
  has_many :movie_countries, as: :countryable
  has_many :movie_directors, as: :directorable
  has_many :movie_productions, as: :productionable

  has_many :genres, through: :movie_genres
  has_many :actors, through: :castings
  has_many :countries, through: :movie_countries
  has_many :directors, through: :movie_directors
  has_many :productions, through: :movie_productions


  has_one :movie_video, as: :videoable, class_name: 'MovieVideo', dependent: :destroy

  has_one_attached :poster
  has_one_attached :thumbnail

  accepts_nested_attributes_for :movie_video, reject_if: proc { |attributes| attributes[:video_url].blank? }

  # validates :name, :description, :imdb, :duration, :release_year, :movie_type, :description, presence: true
  # validate :video_url_presence

  def poster_image_link
    if poster.attached?
      Rails.application.routes.url_helpers.url_for(poster)
    else
      "assets/Images/msd.jpg" # Replace with the path to your default image
    end
  end

  def video_link
    return unless movie_video&.video_url

    $drive.get(movie_video.video_url).web_content_link
  end

  def video_url_presence
    errors.add(:video_url, "must be present") if movie_video.video_url.blank?
  end
end
