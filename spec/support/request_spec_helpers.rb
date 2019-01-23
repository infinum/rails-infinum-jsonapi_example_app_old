module RequestSpecHelpers
  def decode_token(token)
    JWTSerializer.decode(token)
  end

  def get(path, opts = {})
    path = adjust_path(path)
    super
  end

  def post(path, opts = {})
    path = adjust_path(path)
    super
  end

  def put(path, opts = {})
    path = adjust_path(path)
    super
  end

  def delete(path, opts = {})
    path = adjust_path(path)
    super
  end

  def adjust_path(path)
    "/#{path}"
  end
end
