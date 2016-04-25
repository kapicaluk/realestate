class PicturesController < ApplicationController

def index
@listing = Listing.find(params[:listing_id])
@pictures = @listing.pictures
end

def show 
	@listing = Listing.find(params[:listing_id])
	@picture = @listing.pictures.find(params[:id])
def new
	listingId = params[:listing_id]
	@listing = Listing.find(listingId)
	@picture = Picture.new(:listing=>@listing)
end

def create
	listingId = params[:listing_id]
	@listing = Listing.find(listingId)
	@picture = Picture.new(pictures_params)
	@picture.listing = @listing

	uploadedIO = params[:picture][:image]
	if uploadedIO != nil
		t = Time.now
		ext = File.extname(uploadedIO.original_filename)
		tmpFileName = "file_#{t.strftime("%Y%m%d%H%M")}" + ext
		filename = Rails.root.join('public','images', tmpFileName)
		@picture.filename = tmpFileName


	File.open(filename, 'wb') do |file|
		file.write(uploadedIO.read)
	end

if @picture.save
	redirect_to listing_pictures_path
else
	render 'new'
end 
end

end

def edit
	@listing = Listing.find(params[:listingId])
	@picture = @listing.pictures.flind(params[:id])
end

def update
	listingId = params[:listing_id]
	@listing = Listing.find(listingId)

	@picture = @listing.pictures.flind(params[:id])
	uploadIO = params[:picture][:image]

	if uploadIO != nil
if @picture.filename != nil
filename = Rails.root.join('public','images',@picture.filename) 
File.delete(filename) if File.exist?(filename)

end

t = Time.now
ext = File.extname(uploadIO.original_filename) 
tmpFilename = "file_#{t.strftime("%Y%m%d%H%M")}" + ext

@picture.filename = tmpFilename

filename = Rails.root.join('public','images',tmpFilename) 
File.open(filename, 'wb') do |file|
file.write(uploadIO.read)

end
end

if @picture.update(pictures_params)
redirect_to listing_pictures_path(@listing)

else
render 'edit'
end 
end

def destroy
	listingId = params[:listing_id]
	listing = Listing.find(listingId)
	picture = listing.pictures.find(params[:id])
	if picture.filename != nil
	filename = Rails.root.join('public','images',picture.filename)
	File.delete(filename) if File.exist?(filename)
end
listing.pictures.destroy(picture)
redirect_to listing_pictures_path(listing)
end

private
def pictures_params
	params.require(:picture).permit(:listing_id, :title)
end
end


