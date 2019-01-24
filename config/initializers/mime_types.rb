Mime::Type.register "application/vnd.api+json", :jsonapi

ActionDispatch::Request.parameter_parsers[:jsonapi] = -> (body) {
  ActiveSupport::JSON.decode(body)
}
