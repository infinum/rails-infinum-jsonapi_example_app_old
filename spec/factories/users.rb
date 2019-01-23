FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{'+' + n.to_s}@example.com" }
    jti { SecureRandom.uuid }
    password { '123456' }
    first_name { 'John' }
    last_name { 'Doe' }
  end
end
