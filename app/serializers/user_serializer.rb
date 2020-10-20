class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :password, :affliction, :logs, :medicines
  has_many :logs
  has_many :medicines
end
