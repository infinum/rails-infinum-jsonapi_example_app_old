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

      def deserialized_resource(name)
        data = params['data'].to_unsafe_hash

        if data['type'].singularize == name.to_s

          relationships = data['relationships']&.each_with_object({}) do |(relationship, value), result|
            if relationship.singularize == relationship
              result["#{relationship}_id"] = value['data']['id']
            else
              result["#{relationship.singularize}_ids"] = value['data'].map { |rel| rel['id'] }
            end
          end

          ActionController::Parameters.new(
            { id: data['id'] }
              .merge(data['attributes'])
              .merge(relationships || {})
          )
        end
      end
    end
  end
end
