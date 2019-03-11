class SessionForm < ActiveType::Object
  attribute :email, :string
  attribute :password, :string

  validates :email, presence: true
  validates :password, presence: true

  validate :valid_password?

  delegate :first_name, :last_name, :jti, to: :user

  def valid?(args)
    super && user.persisted?
  end

  def user
    @user ||= User.find_for_authentication(email: email)
  end

  def jwt
    JWTSerializer.encode(jti: jti_claim.value)
  end

  private

  def valid_password?
    return if user.valid_password?(password)

    errors.add(:base, "Password doesn't match your e-mail")
  end

  def jti_claim
    user.jti_claims.create(value: SecureRandom.uuid)
  end
end
