module Devise
  module Failures
    class JWTAuthFailure < Devise::FailureApp
      def respond
        request.format == :jsonapi ? json_failure : super
      end

      def json_failure
        Bugsnag.notify(info: 'JWT Auth failure')
        self.status = 401
        self.content_type = 'application/json'
        self.response_body = { errors: [{ detail: 'Unauthorized' }] }.to_json
      end
    end
  end
end
