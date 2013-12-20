class Album < ActiveRecord::Base
	#attr_accessible :name

	validates :name, presence: true

	has_many :photos

	has_many :album_users
	has_many :users, through: :album_users
end
