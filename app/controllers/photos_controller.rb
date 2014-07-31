class PhotosController < ApplicationController
  def index
    # get current users top ten photos
    @images = current_user.photos
  end

  def new
    @image = Photo.new
  end

  def create
    # create a new photo and insert into the database
    @image = Photo.create(image_params)
    current_user.photos << @image
    current_user.save
    redirect_to action: :index  
  end

  private

  def image_params
    params.require(:photo).permit([:img, :description,:tags_list])
  end
end
