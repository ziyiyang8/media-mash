class PhotosController < ApplicationController
  def index
  end

  def new
  	@photo = Photo.new(album_id: params[:album_id])
  end

  def create
  	@photo = Photo.new(photo_params)
  	if @photo.save
  		redirect_to @photo.album
  	else
  		render :action => 'new'
  	end
  end	

  private

  	def photo_params
  		params.require(:photo).permit(:album_id, :image, :title, :description)
  	end

end
