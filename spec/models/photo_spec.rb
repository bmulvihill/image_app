require 'rails_helper'

RSpec.describe Photo, :type => :model do
	context '#tags_list' do
		it 'will return a comma seperated list of ids' do
			photo = Photo.new
			photo.tags << 'hello'
			photo.tags << 'there'
			expect(photo.tags_list).to eql('hello, there')
		end
	end

	context '#tags_list=' do
		it 'will set comma seperated tags into an array' do
			photo = Photo.new
			photo.tags_list = 'hello,there'
			expect(photo.tags).to eql(['hello','there'])
		end
	end
end