class MovieSerializer < BaseSerializer
  set_type :movies
  attributes :title, :released_at, :runtime, :storyline, :budget

  attribute :content_rating do |object|
    object.content_rating.to_s
  end

  belongs_to :director, record_type: :directors
  has_many :genres, record_type: :genres
end
