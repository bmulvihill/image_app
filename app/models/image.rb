class Image
  include Mongoid::Document
  include Mongoid::Paperclip
    has_mongoid_attached_file :png,
    url: "/assets/images/:id/:style/:basename.:extension",
    path: ":rails_root/public/assets/images/:id/:style/:basename.:extension",
    styles: { thumb: '120x120', large: '300x400' }
    do_not_validate_attachment_file_type :png

    field :tags, type: Array
    field :albums, type: Array
    field :thumbs_up, type: Integer
    field :description, type: String
    field :comments, type: Array
end