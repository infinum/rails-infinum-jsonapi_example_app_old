module Api
  module V1
    class MoviesController < ApiController
      def index
        render_jsonapi(query_jsonapi.all)
      end

      private

      def query_class
        JsonApi::MoviesQuery
      end
    end
  end
end
