class Photo
  include Mongoid::Document
  include Mongoid::Paperclip

  belongs_to :user
  belongs_to :album
  has_many :comments, as: :commentable
  before_save :set_tags

  # set file system parameters
  has_mongoid_attached_file :img,
  url: "/assets/system/:id/:style/:basename.:extension",
  path: ":rails_root/public/assets/system/:id/:style/:basename.:extension",
  styles: { thumb: '120x120', large: '300x400' }
  do_not_validate_attachment_file_type :img

  # photo fields allowable in mongodb
  field :tags, type: Array, default: []
  field :thumbs_up, type: Integer, default: 0
  field :description, type: String

  # Returns the url of the image
  def get_url
    img.url
  end
  # Callback performed before model is persisted to the database
  # If any tags are present insert them into the tags field as well
  def set_tags
    # Regex to find tags and set them into the database
    description.scan(/#([A-Za-z0-9]+)/).flatten.each {|tag| self.tags << tag}
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