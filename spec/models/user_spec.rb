describe User do
  it { is_expected.to have_many(:jti_claims) }
  it { is_expected.to validate_presence_of(:email) }
end
