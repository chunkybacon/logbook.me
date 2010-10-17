class ApplicationsController < InheritedResources::Base
  before_filter :authenticate_user!

  def create
    create! do |format|
      format.html { redirect_to applications_path }
    end    
  end

  def update
    update! do |format|
      format.html { redirect_to applications_path }
    end
  end  
  
  protected
  def begin_of_association_chain
    current_user
  end

end
