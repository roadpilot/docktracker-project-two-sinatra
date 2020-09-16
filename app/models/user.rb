class User < ActiveRecord::Base
    has_many :comments
    has_many :locations
    has_secure_password
    #restricts users from attemting signup without completing the form
    #password is validated thru "has_secure_password"
    validates :handle, :email, presence: true
    #restricts users from signing up with an existing user handle or email
    validates :email, :handle, uniqueness: true
end
