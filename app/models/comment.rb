class Comment
  include Mongoid::Document
  include Mongoid::Timestamps #adds created at and updated at fields
  # all comments have one user (reference relation)
  belongs_to :user
  # comments are polymorphic since they can belong to either photos or albums
  belongs_to :commentable, polymorphic: true
  
  field :text, type: String
end