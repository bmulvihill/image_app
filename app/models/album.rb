class Album
	include Mongoid::Document
	belongs_to :user
	has_many :photos
end
