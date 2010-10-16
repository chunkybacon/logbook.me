class EntriesController < ApplicationController
  ssl_required :create  
  skip_before_filter :verify_authenticity_token, :only => :create

  before_filter :authenticate_user!, :only => :index

  def index
    application = current_user.applications.find(params[:application_id])
    @entries = application.entries.order(:created_at).all
    @facilities = @entries.collect(&:facility).uniq
  end

  def create
    @application = Application.find_by_api_key(params[:api_key])
    if @application
      params[:entries].values.each do |entry|
        Entry.create!(entry, :application_id => @application.id)
      end
      head :ok
    else
      render :nothing => true, :status => 401
    end
  end
end
