class User < ActiveRecord::Base
    has_many :comments
    has_many :locations
    has_secure_password
end
