class Category < ActiveRecord::Base
    has_many :categorizations
    has_many :books , through: :categorizations
    accepts_nested_attributes_for :books
end
