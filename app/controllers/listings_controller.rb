class ListingsController < ApplicationController
  before_action :logged_in
  
def index	
	@user = User.find(param[:user_id])
  	@listings = @user.listings.all

end


def new
	@user = User.find(params[:user_id])
	@listing = Listing.new(:user => @user)

end

def create
@user = User.find(params[:user_id])
@listing = Listing.new (listing_params)
@listing.user = @user

if @listing.save

redirect_to root_path 

else

render "new" 

end
end

def edit
# id = params[:id]
# @listing = Listing.find(id)
end

def update
# id = params[:id]
# @listing = Listing.find(id) if @listing.update
# redirect_to root_path else
# render "edit" 
end
end

def destroy
# id = params[:id]
# @listing = Listing.find(id) 
# @listing.destroy

# redirect_to root_path
end

def show 
end


private

def listing_params

params.require(:listing).permit(:user_id, :title, :description, :price,) 

end
end


