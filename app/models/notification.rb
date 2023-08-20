# == Schema Information
#
# Table name: notifications
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  content    :string(255)
#  send_time  :datetime
#  readed     :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Notification < ApplicationRecord
    belongs_to :user
end
