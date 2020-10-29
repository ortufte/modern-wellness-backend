class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email, :affliction, :logs, :medicines
  has_many :logs
  has_many :medicines
end
