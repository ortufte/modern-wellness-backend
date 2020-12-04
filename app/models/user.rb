class User < ApplicationRecord
    has_secure_password

    validates :email,  email: true, uniqueness: true

    has_many :logs
    has_many :medicines

end
