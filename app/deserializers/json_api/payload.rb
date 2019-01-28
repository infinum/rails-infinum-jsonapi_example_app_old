module JsonApi
  class Payload
    def initialize(resource_name, params)
      @resource_name = resource_name
      @data = params['data'].to_unsafe_hash
    end

    def call
      return empty_parameters unless data_type_match?

      ActionController::Parameters.new(
        { id: data['id'] }
        .merge(data['attributes'])
        .merge(relationships || {})
      )
    end

    private

    def empty_parameters
      ActionController::Parameters.new({})
    end

    def data_type_match?
      data['type'] == resource_name.to_s.pluralize
    end

    def relationships
      data['relationships']&.each_with_object({}) do |(relationship_name, value), result|
        if relationship_name.singularize == relationship_name
          result["#{relationship_name}_id"] = value['data']['id']
        else
          result["#{relationship_name.singularize}_ids"] = value['data'].map { |rel| rel['id'] }
        end
      end
    end

    attr_reader :resource_name, :data
  end
end
