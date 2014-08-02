# This controller handles all requests for the Comment model
class CommentsController < ApplicationController
  def new
    # Create new comment object
    @comment = Comment.new
    render layout: false
  end
end
