class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :password, :affliction
end
