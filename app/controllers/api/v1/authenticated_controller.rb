module Api
  module V1
    class AuthenticatedController < ApiController
      before_action :authenticate_api_user!
    end
  end
end
