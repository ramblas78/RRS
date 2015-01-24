class HostsController < ApplicationController
  def index
  	@hosts = current_user.children
  end

  def new
  	@host = current_user.children.build
  end

  def edit
  	@host = User.find(params[:id])
  end

end
