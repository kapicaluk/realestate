class ListingsController < ApplicationController
  def index	
  	@listings = Listing.all
  end


def new
	@listings - Listing.new

end

def create
end

def edit
end

def destroy
end

def show
end


end
