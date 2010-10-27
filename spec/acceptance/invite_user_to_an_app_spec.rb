require File.dirname(__FILE__) + '/acceptance_helper'

feature "Invite User To An App", %q{
  In order to provide access to the app to my teammates
  As an owner of the app
  I want to invite others
} do

  let(:user) { User.make }
  let(:app) { Application.make(:user => user) }

  background do
    log_in_as user
    visit app_dashboard(app)
    click_link "#{app.name} Settings"
  end

  scenario "should instantly add existing users" do
    user = User.make

    within(:css, 'form#new_invite') do
      fill_in 'Email', :with => user.email
      click_button 'Invite this person'
    end

    app.users.size.should == 2
    app.users.should include(user)
  end
end
