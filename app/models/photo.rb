class Photo < ActiveRecord::Base
	belongs_to :album

	mount_uploader :image, PhotoUploader

	before_create :default_title

	def default_title
		self.title ||= File.basename(image.filename, '.*').titleize if image
	end
end
