# == Schema Information
#
# Table name: movies
#
#  id           :bigint           not null, primary key
#  name         :string(255)
#  description  :string(255)
#  imdb         :float(24)
#  rating       :float(24)
#  liked        :integer
#  watched      :integer
#  duration     :integer
#  country      :string(255)
#  release_year :integer
#  rank         :integer          default(0)
#  movie_type   :integer          default("single_movie")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Movie < ApplicationRecord
  enum movie_type: {single_movie: 0, tv_series: 1}
  has_many :list
  has_many :reviews
  has_many :ratings
  has_many :castings
  has_many :user_movie_watchlists
  has_many :movie_genres
  has_many :genres, through: :movie_genres
  has_many :actors, through: :castings
  has_many :list_items, through: :lists
  has_many :tv_episodes
  has_one :movie_video, as: :videoable, class_name: 'MovieVideo', dependent: :destroy

  has_one_attached :poster
  has_one_attached :thumbnail

  accepts_nested_attributes_for :movie_genres
  accepts_nested_attributes_for :movie_video, reject_if: :reject_tv_serires_movie
  accepts_nested_attributes_for :tv_episodes

  validates :name, :description, :imdb, :duration, :release_year, :movie_type, :description, presence: true
  validate :video_url_presence, if: :single_movie?
  validate :video_tv_episodes_presence, if: :tv_series?


  def reject_tv_serires_movie
    self.tv_series?
  end

  def reject_single_movie
    self.single_movie?
  end

  def poster_image_link
    if poster.attached?
      Rails.application.routes.url_helpers.url_for(poster)
    else
      "assets/Images/msd.jpg" # Replace with the path to your default image
    end
  end

  def video_link
    $drive.get(movie_video.video_url).web_content_link
  end

  def video_url_presence
    errors.add(:video_url, "must be present") if movie_video.video_url.blank?
  end

  def video_tv_episodes_presence
    errors.add(:tv_episodes, "must be present") if tv_episodes.blank?
  end
end
