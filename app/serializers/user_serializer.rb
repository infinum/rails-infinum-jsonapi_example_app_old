class UserSerializer < BaseSerializer
  set_type :users

  attribute :email
  attribute :first_name
  attribute :last_name
end
