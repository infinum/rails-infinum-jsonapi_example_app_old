class BaseSerializer
  include FastJsonapi::ObjectSerializer

  set_key_transform :underscore
end
