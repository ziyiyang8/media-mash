class Album < ActiveRecord::Base
	#attr_accessible :name

	validates :name, presence: true

	has_many :photos

	has_many :albumusers
	has_many :users, through: :albumusers, :foreign_key => :user_id
end
