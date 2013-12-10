class Album < ActiveRecord::Base
	attr_accessible :name

	validates :name, presence: true

	has_many :photos

	belongs_to :user
end
