module RequestSpecHelpers
  def decode_token(token)
    JWTSerializer.decode(token)
  end
end
