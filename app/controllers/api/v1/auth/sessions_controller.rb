module Api
  module V1
    module Auth
      class SessionsController < ApiController
        before_action :authenticate_api_user!, only: [:destroy]

        def create
          set_authorization_header(session_form) if session_form.save

          render_jsonapi(session_form)
        end

        def destroy
          current_user.jti_claims.find_by(value: jti_claim)&.destroy

          head :no_content
        end

        private

        def session_form
          @session_form ||= SessionForm.new(session_params)
        end

        def set_authorization_header(session_form)
          response.header['authorization'] = session_form.jwt
        end

        def session_params
          params.from_jsonapi.require(:session).permit(:email, :password)
        end

        def jti_claim
          JWTSerializer.decode(request.headers['authorization'].split(' ').last)['jti']
        end

        def query_class
          JsonApi::UsersQuery
        end
      end
    end
  end
end
