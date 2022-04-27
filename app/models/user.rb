class User < ApplicationRecord
    has_secure_password
    
    validates :email, presence: true, uniqueness: true

    has_many :post
    has_many :offer
end
