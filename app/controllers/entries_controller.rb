class EntriesController < ApplicationController
  ssl_required :create  
  skip_before_filter :verify_authenticity_token, :only => :create

  before_filter :authenticate_user!, :only => :index

  def index
    @application = current_user.applications.find(params[:application_id])
    @entries = Entry.where(:application_id => @application.id).order_by(:created_at)
    @pages   = (@entries.count/100.to_f).ceil
    page = params[:page].try(:to_i)
    page = 1 if !page or page == 0
    @entries = @entries.paginate(:page => page, :per_page => 100)
    @facilities = @entries.collect(&:facility).uniq if @entries

    if @entries.empty?
      render :no_entries
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
