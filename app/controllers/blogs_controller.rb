class BlogsController < ApplicationController
    impressionist actions: [:show], unique: [:session_hash]
    before_action :set_blog, only: [:show, :toggle_status]
    before_action :set_topic, only: [:index, :search]
    before_action :set_user, only: [:index, :search]
    before_action :set_user, only: [:index, :search]
    before_action :set_links
    layout "blog"

    access all: [:show, :index], user: {except: [:toggle_status]}, site_admin: :all

    def search
        if params[:search]
            @blogs= Blog.page.where('name ILIKE ?', "%" + params[:search] + "%").per(5).latest
        end 
    end
      
    def index
        case
            when params[:name] && @admin_user
            @blogs = @topic.blogs.page(params[:page]).per(5).latest
            when params[:name] && @non_admin
            @blogs = @topic.blogs.published.page(params[:page]).per(5).latest
            when params[:tag] && @admin_user
            @blogs = Blog.page.tagged_with(params[:tag]).per(5).latest
            when params[:tag] && @non_admin
            @blogs = Blog.published.page.tagged_with(params[:tag]).per(5).latest
            when @non_admin
            @blogs = Blog.published.page(params[:page]).per(5).latest
            else
            @blogs = Blog.page(params[:page]).per(5).latest
        end
        @page_title = "My Portfolio Blog"
    end
      
    def show
        if logged_in?(:site_admin) || @blog.published?
          @blog = Blog.includes(:comments).friendly.find(params[:id])
          impressionist(@blog, "message...")
          @comment = Comment.new
          @page_title = @blog.name
          @related_post= Blog.where(topic_id: @blog.topic_id).take(3)
        else
          redirect_to blogs_path, notice: "You are not authorized to access this page"
        end
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

    def set_user
        @admin_user = logged_in?(:site_admin)
        @non_admin = !logged_in?(:site_admin)
        @user = User.first
    end
      
    def set_links
        @links = Link.where(category: "social media")
    end
end
