class PagesController < ApplicationController
    def home 
        @categories = Category.all 
        @portfolios = Portfolio.all
        @blogs = Blog.order(created_at: :desc).take(3)
    end
end
