class User < ActiveRecord::Base 
    has_secure_password
    has_many :entries


    validates :username, :name, presence: true
    validates :username, uniqueness: true
end