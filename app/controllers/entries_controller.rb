class EntriesController < ApplicationController
  ssl_required :create

  def index
    @entries = Entry.all
    @facilities = @entries.collect(&:facility).uniq
  end

  def create
    @application = Application.find_by_api_key(params[:api_key])
    if @application
      params[:entries].each do |entry|
        @application.entries.create!(entry)
      end
      head :ok
    else
      render :nothing => true, :status => 401
    end
  end
end
