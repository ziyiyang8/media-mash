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

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Successfully deleted photo"
    redirect_to @photo.album
  end

  private

  	def photo_params
  		params.require(:photo).permit(:album_id, :image, :title, :description, :remote_image_url)
  	end

end
