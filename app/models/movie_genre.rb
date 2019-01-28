# == Schema Information
#
# Table name: movie_genres
#
#  id         :bigint(8)        not null, primary key
#  movie_id   :bigint(8)        indexed, indexed => [genre_id]
#  genre_id   :bigint(8)        indexed, indexed => [movie_id]
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MovieGenre < ApplicationRecord
  belongs_to :movie
  belongs_to :genre

  validates :movie_id, uniqueness: { scope: :genre_id }
end
