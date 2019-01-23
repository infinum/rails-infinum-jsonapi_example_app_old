module ErrorHandling
  extend ActiveSupport::Concern

  BAD_REQUEST_ERRORS = [
    Networking::JsonApiError, Networking::AssociationNotFoundError, Networking::TenantError
  ]

  included do
    rescue_from(*BAD_REQUEST_ERRORS) do |error|
      respond_with_error(400, error)
    end

    rescue_from Networking::UnauthorizedError do
      respond_with_error(401, I18n.t('user.not_authorized'))
    end

    rescue_from Networking::PolicyError do |error|
      respond_with(error.details, status: 403)
    end

    rescue_from Networking::RecordNotFoundError do
      respond_with_error(404, I18n.t('user.not_found'))
    end

    rescue_from JsonApiDeserializer::MediaTypeError do |error|
      respond_with_error 406, error.message
    end

    rescue_from Networking::SendbirdError do |error|
      respond_with_error(424, error)
    end
  end
end
