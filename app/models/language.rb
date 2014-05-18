class Language < ActiveRecord::Base
    has_many :books
    accepts_nested_attributes_for :books
end
