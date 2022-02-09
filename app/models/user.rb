class User < ApplicationRecord

    has_secure_password
    has_many :profiles
    has_many :suits, through: 'profiles'

    validates :email, presence: true, uniqueness: true
end
