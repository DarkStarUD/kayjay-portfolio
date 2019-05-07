class CommentsController < ApplicationController
  def create
  @comment = current_user.comments.build(comment_params)
  puts "######################################################################"
  p @comment
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end