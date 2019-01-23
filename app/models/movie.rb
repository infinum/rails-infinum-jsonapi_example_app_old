# == Schema Information
#
# Table name: movies
#
#  id             :bigint(8)        not null, primary key
#  title          :string
#  released_at    :date
#  runtime        :integer
#  content_rating :string
#  storyline      :text
#  budget         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Movie < ApplicationRecord
  enumeration :content_rating

  validates :title, presence: true
end
