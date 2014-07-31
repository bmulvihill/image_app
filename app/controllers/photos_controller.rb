class PhotosController < ApplicationController
  def index
    @images = current_user.photos
  end

  def new
    @image = Photo.new
  end

  def create
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
