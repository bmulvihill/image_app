require 'rails_helper'

RSpec.describe Album, :type => :model do
  context '#tags_list' do
    it 'will return a comma seperated list of ids' do
      photo = Album.new
      photo.tags << 'hello'
      photo.tags << 'there'
      expect(photo.tags_list).to eql('hello, there')
    end
  end

  context '#tags_list=' do
    it 'will set comma seperated tags into an array' do
      photo = Album.new
      photo.tags_list = 'hello,there'
      expect(photo.tags).to eql(['hello','there'])
    end
  end

  context '#set_tags' do
    it 'will set tags found in the description to the tags field' do
      # tags are expected in the #tag format
      photo = Album.new
      photo.description = 'hello there #hi'
      photo.save
      expect(photo.tags).to eql(['hi'])
    end

    it 'will capture multiple tags' do
      photo = Album.new
      photo.description = 'hello there #hi #there'
      photo.save
      expect(photo.tags).to eql(['hi', 'there'])
    end
  end
end