class Book < ActiveRecord::Base
    has_many :authorships
    has_many :authors, through: :authorships
    accepts_nested_attributes_for :authors

    has_many :categorizations
    has_many :categories, through: :categorizations
    accepts_nested_attributes_for :categories

    has_many :issuings
    has_many :users, through: :issuings
    accepts_nested_attributes_for :users
    belongs_to :language, :dependent => :destroy

end
