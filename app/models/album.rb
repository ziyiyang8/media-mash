class Album < ActiveRecord::Base
	validates :name, presence: true

	has_many :photos

	belongs_to :user
end
