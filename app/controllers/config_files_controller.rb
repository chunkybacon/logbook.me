class ConfigFilesController < ApplicationController
  def show
    @application = Application.find_by_api_key!(params[:id])
    send_data render_to_string(:layout => false),
      :filename => 'logbook.yml',
      :type => :yaml
  end
end
