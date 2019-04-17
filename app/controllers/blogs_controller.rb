class BlogsController < ApplicationController
    before_action :set_blog, only: [:show, :toggle_status]
    before_action :set_topic, only: [:index, :search]
    before_action :set_user, only: [:index, :search]

    access all: [:show, :index], user: {except: [:toggle_status]}, site_admin: :all

    def index
      @blogs = Blog.all
    end

    def show 
    end

    def toggle_status
        if @blog.draft?
            @blog.published!
        elsif @blog.published?
            @blog.draft!
        end
        redirect_to blogs_url, notice: 'Post status has been updated.'
    end

    private

    def set_blog
        @blog = Blog.friendly.find(params[:id])
      end

    def set_topic
        if logged_in?(:site_admin)
            @topics= Topic.with_blogs
        else
            @topics= Topic.with_blogs_published
        end
        @topic= Topic.find_by(:name=> params[:name])
    end

    def set_user
        @admin_user = logged_in?(:site_admin)
        @non_admin = !logged_in?(:site_admin)
        @user = User.first
    end
end
