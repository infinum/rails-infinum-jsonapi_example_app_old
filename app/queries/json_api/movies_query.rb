module JsonApi
  class MoviesQuery < BaseQuery
    def scope
      Movie
    end

    def default_sort
      [title: :asc]
    end
  end
end
