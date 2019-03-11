module Devise
  module Strategies
    class JsonWebToken < Base
      def valid?
        request.headers['authorization'].present?
      end

      def authenticate!
        return fail! unless claims
        return fail! unless required_claims_present? && user.present?

        success! user
      end

      def user
        @user ||= JtiClaim.find_by!(value: claims['jti']).user
      rescue ActiveRecord::RecordNotFound
        Bugsnag.notify(info: 'Failed to find user with JWT token')
        raise NetflixJsonapiExample::RecordNotFoundError
      end

      protected

      def claims
        @claims ||= begin
          strategy, token = request.headers['authorization'].split(' ')

          return JWTSerializer.decode(token) if strategy == 'Bearer'

          nil
        end
      end

      def required_claims_present?
        claims.key?('jti')
      end
    end
  end
end
