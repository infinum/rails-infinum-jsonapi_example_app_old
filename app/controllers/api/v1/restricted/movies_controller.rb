module Api
  module V1
    module Restricted
      class MoviesController < AuthenticatedController
        def create
          movie = Movie.new(movie_params)
          authorize movie
          movie.save

          render_jsonapi(movie)
        end

        private

        def query_class
          JsonApi::MoviesQuery
        end

        def movie_params
          params.from_jsonapi.require(:movie).permit(
            :title, :released_at, :runtime, :content_rating,
            :storyline, :budget, :director_id, genre_ids: []
          )
        end
      end
    end
  end
end
