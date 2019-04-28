class Portfolio < ApplicationRecord
  belongs_to :category
  mount_uploader :image, ImageUploader
  has_many :portfolio_links
end
