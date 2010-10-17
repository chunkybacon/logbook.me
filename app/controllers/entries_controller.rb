class EntriesController < ApplicationController
  ssl_required :create  
  skip_before_filter :verify_authenticity_token, :only => :create

  before_filter :authenticate_user!, :only => :index

  def index
    @filter = EntriesFilter.new(params[:entries_filter])
    @application = current_user.applications.find(params[:application_id])
    @entries = Entry.where(@filter.conditions.merge(:application_id => @application.id)).
                     order_by(:timestamp).
                     paginate(:page => params[:page], :per_page => 20)

    if @entries.empty? && @filter.conditions.empty?
      render :no_entries && return
    end

    if request.xhr?
      render :partial => 'entries', :locals => { :entries => @entries }
    else
      @facilities = @entries.collect(&:facility).uniq
    end
  end

  def create
    @application = Application.find_by_api_key(params[:api_key])
    if @application
      params[:entries].each_value do |entry|
        if entry.is_a? Hash
          create_entry(entry)
        else
          create_entry(params[:entries])
          break
        end
      end
      head :ok
    else
      render :nothing => true, :status => 401
    end
  end

  private

  def create_entry(entry)
    entry.merge!(:application_id => @application.id)
    Entry.create!(entry)
  end
end
