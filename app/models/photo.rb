class Photo < ActiveRecord::Base
	attr_accessible :album_id, :image
	belongs_to :album

	mount_uploader :image, PhotoUploader
end
