# == Schema Information
#
# Table name: castings
#
#  id               :bigint           not null, primary key
#  castingable_type :string(255)
#  castingable_id   :bigint
#  actor_id         :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Casting < ApplicationRecord
    belongs_to :castingable, polymorphic: true
    belongs_to :actor
end
