class JsonApiDeserializer
  MEDIA_TYPE = 'application/vnd.api+json'.freeze

  def initialize(request)
    @request = request
  end

  def valid?
    if content_type_header&.start_with?(MEDIA_TYPE) && accept_header&.start_with?(MEDIA_TYPE)
      true
    else
      raise MediaTypeError
    end
  end

  private

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
