class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  enum status: { draft: 0, published: 1 }
  belongs_to :topic
  mount_uploader :image, ImageUploader
  is_impressionable
  acts_as_taggable 
  has_many :comments, dependent: :destroy
  
  rails_admin do
    field :name
    field :body, :simplemde
    field :image, :carrierwave
    field :status
    field :topic
    field :comments
    field :tag_list
  end

  scope :latest, -> { order("Id DESC") }

  def topic_name=(name)
    self.topic = Topic.find_or_create_by(name: name) if name.present?
  end
  
  def blog_status
    if logged_in?(:user) || !current_user
      @status = published
    else
      @status = all
    end
  end
end
