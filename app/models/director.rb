# == Schema Information
#
# Table name: directors
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Director < ApplicationRecord
  has_many :movies, dependent: :destroy

  validates :name, presence: true
end
