module JsonApiDeserialization
  extend ActiveSupport::Concern

  def valid_jsonapi?
    JsonApi::Request.new(request).valid?
  end

  def deserialized_resource(name)
    JsonApi::Payload.new(name, params).call
  end
end
