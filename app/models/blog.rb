class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  enum status: { draft: 0, published: 1 }
  belongs_to :topic
  mount_uploader :image, ImageUploader
  rails_admin do
    field :name
    field :body, :simplemde
    field :image, :carrierwave
    field :topic
    field :status
  end

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
