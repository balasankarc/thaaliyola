class Authorship < ActiveRecord::Base
    belongs_to :book, :dependent => :destroy
    belongs_to :author , :dependent => :destroy
end
