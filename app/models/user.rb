class User < ActiveRecord::Base
    has_many :books
    validates :admissionnumber, uniqueness: true
    validates :username, uniqueness: true
    validates_confirmation_of :password, :message => "Passwords must match"
    validates_presence_of :password_confirmation, :if => :password_changed?
    before_save :encrypt_password
    def encrypt_password
        self.password = Digest::SHA1.hexdigest(self.password)
    end
end
