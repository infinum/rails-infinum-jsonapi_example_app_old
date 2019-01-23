module JsonApiDeserialization
  extend ActiveSupport::Concern

  def valid_jsonapi?
    JsonApiDeserializer.new(request).valid?
  end
end
