class User < ApplicationRecord
    has_secure_password

    validates_uniqueness_of :email
    has_many :bookusers
    has_many :books

end
