class PhotosController < ApplicationController
  def index
  end

  def new
  	@photo = Photo.new(album_id: params[:album_id])
  end

  def create
  	#@photo = Photo.new(photo_params)
    @album = Album.find(params[:album_id])
    @photo = @album.photos.create(photo_params)

   #  @photo.album = @album
  	# if @photo.save
   #    flash[:notice] = "Photos added"
  	# 	redirect_to @photo.album
  	# else
  	# 	render :action => 'new'
  	# end
  end	

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Successfully deleted photo"
    redirect_to @photo.album
  end

  def download
    @photo = Photo.find(params[:id])
    send_file (@photo.image.path)
  end

  private

  	def photo_params
  		params.require(:photo).permit(:album_id, :image, :title, :description, :remote_image_url)
  	end

end
