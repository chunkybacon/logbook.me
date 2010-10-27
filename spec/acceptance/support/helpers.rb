module HelperMethods
  def log_in_as(user)
    visit log_in_page
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_button 'Sign in'
  end
end

RSpec.configuration.include HelperMethods, :type => :acceptance
