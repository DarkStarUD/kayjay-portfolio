class Topic < ApplicationRecord
    validates_presence_of :name
    has_many :blogs

    def self.with_blogs_published
        includes(:blogs).where.not(blogs: {id: nil, status: "draft"})
    end
    
    def self.with_blogs
        includes(:blogs).where.not(blogs: {id: nil})
    end
end
