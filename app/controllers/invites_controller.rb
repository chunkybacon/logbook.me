class InvitesController < InheritedResources::Base
  belongs_to :application
  before_filter :authenticate_user!

  def create
    create! { edit_application_path(parent) }
  end

  protected

    def begin_of_association_chain
      current_user
    end
end
