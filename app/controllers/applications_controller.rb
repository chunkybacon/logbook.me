class ApplicationsController < InheritedResources::Base
  before_filter :authenticate_user!

  def create
    create! do |success, failure|
      success.html { redirect_to application_entries_path(@application)  }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to applications_path }
    end
  end  
  
  protected
  def begin_of_association_chain
    current_user
  end

end
