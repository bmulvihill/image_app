class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
    redirect_to action: :index  
  end

  private

  def image_params
    params.require(:image).permit(:png)
  end
end