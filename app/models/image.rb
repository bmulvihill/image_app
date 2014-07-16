class Image
  include Mongoid::Document
    field :tags, type: Array
    field :albums, type: Array
    field :thumbs_up, type: Int
    field :description, type: String
    field :comments, type: Array
    field :image, type: Moped::BSON::Binary
end