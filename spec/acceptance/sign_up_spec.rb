require File.dirname(__FILE__) + '/acceptance_helper'

feature "Sign Up", %q{
  In order to log stuff in my app
  As an app owner
  I want to sign up
} do

  scenario "should create an account and the first app at once" do
    visit homepage

    click_link 'Sign up'
    fill_in 'Email', :with => 'email@example.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    fill_in 'Your application name', :with => 'facebook'
    click_button 'Sign up'

    user = User.find_by_email('email@example.com')
    user.applications.size.should == 1
    user.applications.first.name.should == 'facebook'
    user.applications.first.owner.should == user
  end
end
