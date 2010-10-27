module NavigationHelpers
  # Put helper methods related to the paths in your application here.

  def homepage
    "/"
  end

  def log_in_page
    '/users/sign_in'
  end

  def app_dashboard(app)
    "/applications/#{app.id}/entries"
  end
end

RSpec.configuration.include NavigationHelpers, :type => :acceptance
