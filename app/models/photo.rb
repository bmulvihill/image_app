class Photo
  include Mongoid::Document
  include Mongoid::Paperclip
  belongs_to :user
  belongs_to :album
  has_many :comments

  # set file system parameters
  has_mongoid_attached_file :img,
  url: "/assets/system/:id/:style/:basename.:extension",
  path: ":rails_root/public/assets/system/:id/:style/:basename.:extension",
  styles: { thumb: '120x120', large: '300x400' }
  do_not_validate_attachment_file_type :img

  # photo fields allowable in mongodb
  field :tags, type: Array, default: []
  field :albums, type: Array, default: []
  field :thumbs_up, type: Integer
  field :description, type: String
  field :comments, type: Array

  # set tags into an array
  def tags_list=(arg)
    self.tags = arg.split(',').map { |v| v.strip }
  end

  # retrieve all tags in a comma seperated string
  def tags_list
    self.tags.join(', ')
  end
end