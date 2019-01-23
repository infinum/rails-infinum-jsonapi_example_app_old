module CustomJsonApiResponders
  extend ActiveSupport::Concern

  def render_jsonapi(resource, options = {})
    response_builder = ResponseBuilder.new(resource, params)
    serializer = options[:serializer] || default_serializer

    if resource.respond_to?(:errors) && resource.errors.present?
      render json: error_response(resource), status: :unprocessable_entity
    else
      render json: serializer.new(resource, response_builder.jsonapi_options)
    end
  end

  def default_serializer
    "#{query_class.to_s.demodulize.split('Query').first.singularize}Serializer".constantize
  end

  def query_jsonapi
    query_class.new(current_user, params)
  end

  def query_class
    raise NotImplementedError
  end

  def error_response(resource)
    { errors: resource.errors.map do |source, error|
      {
        title: 'Unprocessable entity',
        detail: error,
        source: {
          parameter: source,
          pointer: "data/attributes/#{source}"
        }
      }
    end }
  end
end
