# == Schema Information
#
# Table name: jti_claims
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)        indexed
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class JtiClaim < ApplicationRecord
  belongs_to :user

  validates :value, presence: true
end
