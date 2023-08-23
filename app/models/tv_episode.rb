# == Schema Information
#
# Table name: tv_episodes
#
#  id               :bigint           not null, primary key
#  movie_id         :bigint
#  name             :string(255)
#  title            :string(255)
#  order            :integer
#  release_date     :date
#  tv_season_title  :string(255)
#  tv_seasion_order :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class TvEpisode < ApplicationRecord
  belongs_to :movie
  has_one :movie_video, as: :videoable, class_name: 'MovieVideo', dependent: :destroy

  accepts_nested_attributes_for :movie_video

  validates :name, presence: true
  validate :video_url_presence

  def video_url_presence
    errors.add(:movie_video, "must be present") if movie_video.blank?
  end
end
