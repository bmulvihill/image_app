# This controller handles all requests for the Album model
class AlbumsController < ApplicationController
  
  def index
    # Query all albums from the database
    # Translates to the following MongoDB query:
    # db.albums.find()
    @albums = Album.all
  end

  def new 
    # Create new album object
    @album = Album.new
  end

  def create
    # create a new album and insert into the database
    @album = Album.create(album_params)
    current_user.albums << @album
    current_user.save
    redirect_to action: :index  
  end

  def show
    # Query to find the album being searched for
    @album = Album.find(params[:id])
    @images = @album.photos
  end

  private

  def album_params
    params.require(:album).permit([:name, :description])
  end
end
