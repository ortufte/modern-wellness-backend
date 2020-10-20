class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true

    has_many :logs
    has_many :medicines

end
