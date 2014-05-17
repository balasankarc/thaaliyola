class User < ActiveRecord::Base
    has_many :books
    validates :admissionnumber, uniqueness: true
    validates :username, uniqueness: true
end
