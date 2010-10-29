require File.dirname(__FILE__) + '/acceptance_helper'

feature "Invite User To An App", %q{
  In order to provide access to the app to my teammates
  As an owner of the app
  I want to invite others
} do

  let(:membership) { ApplicationMembership.make }
  let(:user) { membership.user }
  let(:app) { membership.application }

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

    page.should have_content('This person was invited')

    app.users.size.should == 2
    app.users.should include(user)
  end

  scenario "should invite new people" do
    within(:css, 'form#new_invite') do
      fill_in 'Email', :with => 'email@example.com'
      click_button 'Invite this person'
    end

    page.should have_content('This person was invited')

    app.users.size.should == 1
    app.invites.size.should == 1
    app.invites.first.email.should == 'email@example.com'
  end

  scenario "should validate invites" do
    within(:css, 'form#new_invite') do
      fill_in 'Email', :with => 'foo'
      click_button 'Invite this person'
    end

    page.should have_no_content('This person was invited')
    page.should have_content('We could not invite this person')
    app.invites.should be_empty
  end
end
