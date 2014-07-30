class User < ActiveRecord::Base
    has_many :issuings
    has_many :books, through: :issuings
    accepts_nested_attributes_for :books
    validates :username, uniqueness: true
    validates_confirmation_of :password, :message => "Passwords must match"
    validates_presence_of :password_confirmation, :if => :password_changed?
    has_many :reservations
    has_attached_file :profpic
    validates_attachment_content_type :profpic, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
#    before_save :encrypt_password
    #def encrypt_password
        #puts "Current Password" + self.password
        #self.password = Digest::SHA1.hexdigest(self.password)
    #end
end
