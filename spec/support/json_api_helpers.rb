module JsonApiHelpers
  def json_response
    JSON.parse(response.body)
  end

  def response_array
    json_response['data']
  end

  def response_meta
    json_response['meta']
  end

  def json_api_params(params)
    {
      data: {
        id: params[:id],
        type: params[:type],
        attributes: params.except(:type, :id, :relationships),
        relationships: params[:relationships]
      }.compact
    }.compact.to_json
  end

  def default_headers
    {
      'content-type' => 'application/vnd.api+json',
      'accept' => 'application/vnd.api+json'
    }
  end

  def authenticated_headers(user, opts = {})
    token = JWTSerializer.encode(jti: user.jti_claims.first.value)
    default_headers.merge(opts).merge('authorization' => "Bearer #{token}")
  end
end
