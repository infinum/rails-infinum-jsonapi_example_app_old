module JsonApi
  class Request
    MEDIA_TYPE = 'application/vnd.api+json'.freeze

    def initialize(request)
      @request = request
    end

    def valid?
      raise MediaTypeError unless content_type_header&.start_with?(MEDIA_TYPE)

      true
    end

    private

    def content_type_header
      request.headers['content-type']
    end

    class MediaTypeError < ArgumentError; end

    attr_reader :request
  end
end
