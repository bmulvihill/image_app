# This controller handles all requests for the Album model
class AlbumsController < ApplicationController
  
  def index
    # Query all albums from the database
    # Translates to the following MongoDB query:
    # db.albums.find()
    @albums = current_user.albums
  end

  def new 
    # Create new album object
    @album = Album.new
  end

  def create
    # create a new album and insert into the database
    # This query translates to
    # db.albums.insert({_id: params[:id], name: params[:name], description: params[:description]})
    @album = Album.create(album_params)
    # add the referential relationship between the user and the album
    current_user.albums << @album
    current_user.save
    redirect_to action: :index  
  end

  def show
    # Query to find the album being searched for
    # This query translates to
    # db.albums.find({_id: param[:id]})
    @album = Album.find(params[:id])
    @photos = @album.photos
  end

  def tags
    # This query translates to
    # db.albums.find({tags: params[:tag]})
    @albums = Album.where(:tags => params[:tag])
    render :index
  end

  private

  # These are white listed parameters to prevent unwanted database properties from being written to
  def album_params
    params.require(:album).permit([:name, :description])
  end
end
