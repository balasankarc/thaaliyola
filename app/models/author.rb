class Author < ActiveRecord::Base
    has_many :authorships
    has_many :books, through: :authorships
    accepts_nested_attributes_for :books
end
