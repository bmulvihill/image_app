class PhotosController < ApplicationController
  def index
    # get current users photos sorted by thumbs up desc
    # This qury translates to
    # db.photos.find({"user_id"=> current_user.id}, "$orderby"=>{"thumbs_up"=>-1})
    @photos = current_user.photos.order_by(:thumbs_up.desc)
  end

  def show
    # returns a single photo document
    # This query translates to
    # db.photos.find({_id: params[:id]})
    @photo = Photo.find(params[:id])
  end

  def new
    # Create a new photo object
    @photo = Photo.new
    @album = params[:album_id]
    # Find all albums
    # This query translates to
    # db.albums.find({"user_id"=> current_user.id})
    @albums = current_user.albums
  end

  def create
    # Insert new photo into the MongoDB photo collection
    # This query translates to
    # db.photo.insert({_id: ObjectID, img: params[:img], description: params[:description], tags: params[:tags, album: params[:album_id]]})
    @photo = Photo.new(photo_params)
    if @photo.save
      current_user.photos << @photo
      current_user.save
      redirect_to action: :index
    else
      flash[:alert] = "Please upload a valid format"
      redirect_to :back
    end 
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to action: :index 
  end

  # Query MongoDB for all tags matching parameter
  def tags
    # This query translates to
    # db.photos.find({tags: params[:tag]})
    @photos = Photo.where(:tags => params[:tag])
    render :index
  end

  def thumbs_up
    # Add Thumbs up to a photo document
    # This query translates to
    # db.photo.findOne({_id: params[:ids]})
    @photo = Photo.find(params[:photo_id])
    # update the document
    @photo.thumbs_up += 1
    # save the document
    @photo.save
    redirect_to :back   
  end

  private

  # These are white listed parameters to prevent unwanted database properties from being written to
  def photo_params
    params.require(:photo).permit([:img, :description,:tags_list, :album_id])
  end
end
