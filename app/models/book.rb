class Book < ApplicationRecord
    validates :title, presence: true, length: { minimum: 2 }
    validates :author, presence: true, length: { minimum: 2 }
    has_many :bookusers
    has_many :users
end
