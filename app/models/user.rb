class User < ActiveRecord::Base
    has_many :albums

    validates_presence_of :email, :password
    
    has_secure_password
end