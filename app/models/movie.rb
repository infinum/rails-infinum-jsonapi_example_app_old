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

  has_many :movie_genres, class_name: 'MovieGenre', dependent: :destroy
  has_many :genres, through: :movie_genres

  validates :title, presence: true
end
