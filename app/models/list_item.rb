# == Schema Information
#
# Table name: list_items
#
#  id         :bigint           not null, primary key
#  list_id    :bigint
#  movie_id   :bigint
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ListItem < ApplicationRecord
    belongs_to :movie
    belongs_to :list
end
