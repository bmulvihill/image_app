class Album
  include Mongoid::Document
  belongs_to :user
  has_many :photos 
  has_many :comments, as: :commentable

  field :name, type: String
  field :description, type: String
  field :tags, type: Array, default: []

  def get_cover_image_url
    photos.first.get_url unless photos.empty?
  end
  # set tags into an array
  def tags_list=(arg)
    self.tags = arg.split(',').map { |v| v.strip }
  end

  # retrieve all tags in a comma seperated string
  def tags_list
    self.tags.join(', ')
  end 
end
