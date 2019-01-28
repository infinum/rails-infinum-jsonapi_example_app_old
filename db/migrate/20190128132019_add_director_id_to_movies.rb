class AddDirectorIdToMovies < ActiveRecord::Migration[5.2]
  def change
    add_reference :movies, :director, foreign_key: true
  end
end
