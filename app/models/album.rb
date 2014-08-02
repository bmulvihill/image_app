class Album
  include Mongoid::Document
  belongs_to :user
  has_many :photos

  field :name, type: String
  field :tags, type: Array

  # set tags into an array
  def tags_list=(arg)
    self.tags = arg.split(',').map { |v| v.strip }
  end

  # retrieve all tags in a comma seperated string
  def tags_list
    self.tags.join(', ')
  end 
end
