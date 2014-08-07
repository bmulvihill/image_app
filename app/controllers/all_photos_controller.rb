class AllPhotosController < ApplicationController
  def index
    @photos = Photo.all.order_by(:thumbs_up.desc)
    render 'photos/index'
  end
end