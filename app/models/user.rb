# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  username               :string(255)
#  email                  :string(255)
#  password_digest        :string(255)
#  role                   :integer          default(0)
#  rank                   :integer          default(0)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  coins                  :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
class User < ApplicationRecord
  has_many :lists
  has_many :reviews
  has_many :ratings
  has_many :user_movie_watchlists
end
