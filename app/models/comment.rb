class Comment
  include Mongoid::Document
  include Mongoid::Timestamps #adds created at and updated at fields
  belongs_to :photo
  belongs_to :user
  belongs_to :album
  
  field :text, type: String
end