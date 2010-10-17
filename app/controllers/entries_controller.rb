class EntriesController < ApplicationController
  ssl_required :create  
  skip_before_filter :verify_authenticity_token, :only => :create

  before_filter :authenticate_user!, :only => :index

  def index
    @filter = EntriesFilter.new(params[:entries_filter])
    @application = current_user.applications.find(params[:application_id])
    @entries = Entry.where(@filter.conditions.merge(:application_id => @application.id)).
                     order_by(:created_at).
                     paginate(:page => params[:page], :per_page => 100)

    if @entries.empty?
      render :no_entries
    else
      @facilities = @entries.collect(&:facility).uniq
    end
  end

  def create
    @application = Application.find_by_api_key(params[:api_key])
    if @application
      params[:entries].values.each do |entry|
        entry.merge!(:application_id => @application.id)
        Entry.create!(entry)
      end
      head :ok
    else
      render :nothing => true, :status => 401
    end
  end
end
