class Book < ApplicationRecord
    validates :title, presence: true, length: { minimum: 2 }
    validates :author, presence: true, length: { minimum: 2 }
    has_many :bookusers, dependent: :delete_all
    has_many :users
end
