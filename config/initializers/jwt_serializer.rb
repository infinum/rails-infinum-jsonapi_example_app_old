module JWTSerializer
  module_function

  def encode(payload)
    JWT.encode payload, Rails.application.secrets.jwt_secret
  end

  def decode(token)
    begin
      JWT.decode(token, Rails.application.secrets.jwt_secret).first
    rescue JWT::DecodeError, JWT::VerificationError => exception
      Bugsnag.notify(exception)
      nil
    end
  end
end
