module CustomJsonApiResponders
  extend ActiveSupport::Concern

  def render_jsonapi(resource, options = {})
    response_builder = ResponseBuilder.new(resource, params)
    options[:serializer] ||= default_serializer
    response_options = options.merge(response_builder.jsonapi_options)

    respond_with(resource, response_options)
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
end
