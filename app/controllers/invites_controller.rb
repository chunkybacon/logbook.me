class InvitesController < InheritedResources::Base
  belongs_to :application
  defaults :resource_class => InviteFactory, :instance_name => 'invite_factory'
  before_filter :authenticate_user!

  def create
    @invite_factory = InviteFactory.new(parent, params[:invite])
    create! do |success, failure|
      success.html { redirect_to edit_application_path(parent) }
      failure.html { redirect_to edit_application_path(parent) }
    end
  end

  protected

    def begin_of_association_chain
      current_user
    end
end
