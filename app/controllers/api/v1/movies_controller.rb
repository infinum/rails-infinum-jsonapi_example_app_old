module Api
  module V1
    class MoviesController < ApiController
      def index
        render_jsonapi query_jsonapi.all
      end

      def create
        movie = query_jsonapi.scope.new(movie_params)
        movie.save

        render_jsonapi movie
      end

      private

      def query_class
        JsonApi::MoviesQuery
      end

      def movie_params
        deserialized_resource(:movie).permit(
          :title, :released_at, :runtime, :content_rating,
          :storyline, :budget, :director_id, genre_ids: []
        )
      end
    end
  end
end
