class PhotosController < ApplicationController
  before_action :get_photo, only: [:edit, :update, :destroy]

  def index
  end

  def new
  	@photo = Photo.new(album_id: params[:album_id])
  end

  def edit
  end

  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.create(photo_params)
  end	

  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo.album, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photo.destroy
    flash[:notice] = "Successfully deleted photo"
    redirect_to @photo.album
  end

  def download
    @photo = Photo.find(params[:id])
    send_file (@photo.image.path)
  end

  private

    def get_photo
      @photo = Photo.find(params[:id])
    end


  	def photo_params
  		params.require(:photo).permit(:album_id, :image, :title, :description, :remote_image_url)
  	end

end
