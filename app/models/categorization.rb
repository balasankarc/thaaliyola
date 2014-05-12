class Categorization < ActiveRecord::Base
    has_many :book
    has_many :category
end
