class PhotosController < ApplicationController
  def index
  end

  def new
  end

  private

  	def photo_params
  		params.require(:photo).permit(:album_id, :image)
  	end

end
