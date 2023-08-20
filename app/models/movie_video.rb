# == Schema Information
#
# Table name: movie_videos
#
#  id             :bigint           not null, primary key
#  videoable_type :string(255)
#  videoable_id   :bigint
#  video_url      :string(255)
#  server_name    :string(255)
#  server_order   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class MovieVideo < ApplicationRecord
  belongs_to :videoable, polymorphic: true
end
