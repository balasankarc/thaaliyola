class Author < ActiveRecord::Base
    has_many :authorships
    has_many :books, through: :authorships, :dependent => :destroy
    accepts_nested_attributes_for :books
    has_attached_file :photo
    validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
   
end
