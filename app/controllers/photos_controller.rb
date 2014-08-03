class PhotosController < ApplicationController
  def index
    # get current users top ten photos
    @photos = current_user.photos
  end

  def new
    # Create a new photo object
    @photo = Photo.new
    # Find all albums
    # This query translates to
    # db.albums.find()
    @albums = current_user.albums
  end

  def create
    # Insert new photo into the MongoDB photo collection
    # This query translates to
    # db.photo.insert({_id: ObjectID, img: params[:img], description: params[:description], tags: params[:tags, album: params[:album_id]]})
    @photo = Photo.create(photo_params)
    current_user.photos << @photo
    current_user.save
    redirect_to action: :index  
  end

  # Query MongoDB for all tags matching parameter
  def tags
    # This query translates to
    # db.photos.find({tags: params[:tag]})
    @photos = Photo.where(:tags => params[:tag])
    render :index
  end

  private

  # These are white listed parameters to prevent unwanted database properties from being written to
  def photo_params
    params.require(:photo).permit([:img, :description,:tags_list, :album_id])
  end
end
