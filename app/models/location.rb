class Location < ActiveRecord::Base
    has_many :comments
    validates :address, :business_name, presence: true
end
