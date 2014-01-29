class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :albumusers
  has_many :albums, through: :albumusers, :foreign_key => :album_id

end
