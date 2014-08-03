class Album
  include Mongoid::Document
  belongs_to :user
  has_many :photos 
  has_many :comments, as: :commentable
  before_save :set_tags

  field :name, type: String
  field :description, type: String
  field :tags, type: Array, default: []

  def get_cover_image_url
    photos.first.get_url unless photos.empty?
  end

  # Callback performed before model is persisted to the database
  # If any tags are present insert them into the tags field as well
  def set_tags
    # Regex to find tags and set them into the database
    description.scan(/(?:\s|^)(?:#(?!(?:\d+|\w+?_|_\w+?)(?:\s|$)))(\w+)(?=\s|$)/i).flatten.each {|tag| self.tags << tag}
    self.tags.uniq!
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
