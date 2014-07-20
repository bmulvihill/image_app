class PicsController < ApplicationController
  def index
    @images = Pic.all
  end

  def new
    @image = Pic.new
  end

  def create
    @image = Pic.create(image_params)
    redirect_to action: :index  
  end

  private

  def image_params
    params.require(:pic).permit(:png)
  end
end
