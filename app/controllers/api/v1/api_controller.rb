module Api
  module V1
    class ApiController < ActionController::API
      include JsonApiDeserialization
      include Authentication
      include JsonApiResponders
      include CustomJsonApiResponders
      include ErrorHandling

      before_action :skip_session
      before_action :valid_jsonapi?

      private

      def skip_session
        request.session_options[:skip] = true
      end
    end
  end
end
