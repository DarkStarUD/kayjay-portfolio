class Category < ApplicationRecord
    has_many :portfolios
    validates_presence_of :name
end
