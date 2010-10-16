class SitesController < ApplicationController
  before_filter :authenticate_user!, :only => "dashboard"
  
  def index
    if current_user
      @applications = current_user.applications
      render 'applications/index'
    else
      render :index
    end
    return
  end
end
