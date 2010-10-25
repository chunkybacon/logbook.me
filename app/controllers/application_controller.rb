require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery

  include SslRequirement

  def after_sign_in_path_for(resource_or_scope)
    resource_or_scope.applications.count == 1 ?
      application_entries_path(resource_or_scope.applications.first) :
      root_path
  end
end
