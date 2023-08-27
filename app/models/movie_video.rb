# == Schema Information
#
# Table name: movie_videos
#
#  id             :bigint           not null, primary key
#  videoable_type :string(255)
#  videoable_id   :bigint
#  video_url      :string(255)
#  server_name    :string(255)      default("vidstream")
#  server_order   :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class MovieVideo < ApplicationRecord
  belongs_to :videoable, polymorphic: true
  validates :video_url, presence: true

  def video_link
    return unless video_url

    $drive.get(video_url).web_content_link || nil
  end
end
