class Book < ActiveRecord::Base
    has_many :authorships
    has_many :authors, through: :authorships
    accepts_nested_attributes_for :authors
end
