class UsersController < ApplicationController
  before_action :logged_in
  before_action :checkAuth
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

private 
def checkAuth
  is_authorized ('Admin')
end

end
