module JsonApiDeserialization
  extend ActiveSupport::Concern

  def deserialized_params
    @deserialized_params ||= JsonApiDeserializer.new(request).params
  end

  def valid_jsonapi?
    JsonApiDeserializer.new(request).valid?
  end
end
