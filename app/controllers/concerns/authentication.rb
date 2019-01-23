module Authentication
  extend ActiveSupport::Concern

  def authenticate_api_user!
    raise NetflixJsonapiExample::UnauthorizedError if current_user.blank?
  end

  def current_user
    @current_user ||= warden.authenticate(scope: :user)
  end
end
