class JsonApiDeserializer
  MEDIA_TYPE = 'application/vnd.api+json'.freeze

  def initialize(request)
    @request = request
  end

  def params
    deserialized_params if valid?
  end

  def valid?
    if content_type_header&.start_with?(MEDIA_TYPE) && accept_header&.start_with?(MEDIA_TYPE)
      true
    else
      raise MediaTypeError
    end
  end

  private

  def deserialized_params
    ActionController::Parameters.new(deserialize(JSON.parse(request_params)))
  end

  def deserialize(body)
    JSONAPI::Deserializable::Resource.call(body)
  rescue JSONAPI::Parser::InvalidDocument => error
    raise Networking::JsonApiError, error
  end

  def request_params
    request.body.read
  end

  def accept_header
    request.headers['accept']
  end

  def content_type_header
    request.headers['content-type']
  end

  class MediaTypeError < ArgumentError
    def message
      I18n.t('media_type_error')
    end
  end

  attr_reader :request
end
