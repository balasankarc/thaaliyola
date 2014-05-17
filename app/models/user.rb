class User < ActiveRecord::Base
    has_many :books
    validates :username, uniqueness: true
end
