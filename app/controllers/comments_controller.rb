# This controller handles all requests for the Comment model
class CommentsController < ApplicationController
  def new
    # Create new comment object
    @parent = Photo.find(params[:photo_id]) if params[:photo_id]
    @parent = Album.find(params[:album_id]) if params[:album_id]
    render layout: false
  end

  def create
    # Insert new comment into MongoDB
    # Set the ID String to BSON object id (used by Mongo)
    commentable_id = BSON::ObjectId.from_string(params[:comment][:commentable_id])
    @comment = Comment.create(comment_params)
    @comment.commentable_id = commentable_id
    @comment.user = current_user
    # Save the record to the database
    @comment.save
    redirect_to :back
    #redirect_to action: :index, controller: @comment.commentable_type.underscore.pluralize
  end

  private
  
  # These are white listed parameters to prevent unwanted database properties from being written to
  def comment_params
    params.require(:comment).permit([:text, :commentable_id, :commentable_type])
  end
end
