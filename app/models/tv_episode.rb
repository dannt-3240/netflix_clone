# == Schema Information
#
# Table name: tv_episodes
#
#  id               :bigint           not null, primary key
#  tv_serie_id      :bigint
#  name             :string(255)
#  order            :integer          default(0)
#  release_date     :date
#  tv_season_title  :string(255)
#  tv_season_order :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class TvEpisode < ApplicationRecord
  belongs_to :tv_serie
  has_one :movie_video, as: :videoable, class_name: 'MovieVideo', dependent: :destroy

  accepts_nested_attributes_for :movie_video

  validates :name, presence: true
  validate :video_url_presence

  before_create :generate_field

  def video_url_presence
    errors.add(:movie_video, "must be present") if movie_video.blank?
  end

  def generate_field
    generate_tv_season_title
    generate_tv_episode_order
  end

  def generate_tv_season_title
    return if tv_season_title.present?

    self.tv_season_title = "Season #{tv_season_order}"
  end

  def generate_tv_episode_order
    max_order = self.class.where(tv_serie: tv_serie_id, tv_season_order: tv_season_order).maximum(:order)

    self.order = max_order.to_i + 1
  end
end
