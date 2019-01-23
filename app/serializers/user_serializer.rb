class UserSerializer < BaseSerializer
  set_type :users
  attributes :email, :first_name, :last_name
end
