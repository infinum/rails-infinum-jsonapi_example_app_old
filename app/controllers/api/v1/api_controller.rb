module Api
  module V1
    class ApiController < ActionController::API
      include JsonApiResponders
      include JsonApiResponders::Pagination
      include JsonApiDeserialization
      include ResponseAdapter
      include EagerLoadRelationships

      before_action :skip_session
      before_action :valid_jsonapi?

      private

      def skip_session
        request.session_options[:skip] = true
      end
    end
  end
end
