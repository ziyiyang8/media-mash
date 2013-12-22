class Album < ActiveRecord::Base
	validates :name, presence: true

	has_many :photos

	has_many :albumusers
	has_many :users, through: :albumusers, :foreign_key => :user_id
end
