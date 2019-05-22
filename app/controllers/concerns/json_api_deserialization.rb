module JsonApiDeserialization
  extend ActiveSupport::Concern

  def valid_jsonapi?
    JsonApi::Request.new(request).valid?
  end
end
