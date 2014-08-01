class Comment
	include Mongoid::Document
	belongs_to :photo
	belongs_to :user
end