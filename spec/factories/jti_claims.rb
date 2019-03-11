FactoryBot.define do
  factory :jti_claim do
    user
    value { SecureRandom.uuid }
  end
end
