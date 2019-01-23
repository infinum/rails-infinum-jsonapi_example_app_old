module Api
  module V1
    module Auth
      class SessionsController < ApiController
        deserializable_resource :session, only: [:create]
        before_action :authenticate_api_user!, only: [:destroy]

        def create
          set_authorization_header(session_form) if session_form.save

          render_jsonapi(session_form)
        end

        def destroy
          current_user.update(jti: SecureRandom.uuid)

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
          params.require(:session).permit(:email, :password)
        end

        def query_class
          JsonApi::UsersQuery
        end
      end
    end
  end
end
