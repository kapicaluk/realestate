class ListingsController < ApplicationController
  
def index	

  	@listings = Listing.all

end


def new

	@listing = Listing.new

end

def create

@listing = Listing.new (listing_params)

if @listing.save

redirect_to root_path 

else

render "new" 

end

end

def edit
id = params[:id]
@listing = Listing.find(id)
end

def update
id = params[:id]
@listing = Listing.find(id) if @listing.update
redirect_to root_path else
render "edit" 
end
end

def destroy
id = params[:id]
@listing = Listing.find(id) 
@listing.destroy
redirect_to root_path
end


private

def listing_params
params.require(:listing).permit(:title, :description, :price,) 
end


