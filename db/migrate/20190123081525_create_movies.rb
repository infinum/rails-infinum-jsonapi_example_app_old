class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :released_at
      t.integer :runtime
      t.string :content_rating
      t.text :storyline
      t.integer :budget

      t.timestamps
    end
  end
end
