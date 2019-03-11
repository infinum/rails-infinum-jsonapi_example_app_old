class MovieSerializer < BaseSerializer
  set_type :movies

  attribute :title
  attribute :released_at
  attribute :runtime
  attribute :storyline
  attribute :budget

  attribute :content_rating do |object|
    object.content_rating.to_sym
  end

  belongs_to :director, record_type: :directors
  has_many :genres, record_type: :genres, serializer: GenreSerializer
end
