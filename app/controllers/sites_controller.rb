class SitesController < ApplicationController
  before_filter :authenticate_user!, :only => "dashboard"
  
  def index
    if current_user
      render :dashboard
    else
      render :index
    end
    return
  end

  def dashboard
  end
end
