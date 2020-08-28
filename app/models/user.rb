class User < ActiveRecord::Base
    has_many :albums

    validates_presence_of :email, :password, :username
    
    has_secure_password
end