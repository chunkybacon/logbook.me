require 'spec_helper'

describe InviteFactory do
  let(:app) { Application.make }

  context 'when creating an invite for an existing user' do
    let(:user) { User.make} 

    subject { InviteFactory.new(app, :email => user.email) }

    it 'should instantly add the user to the app' do
      subject.save
      app.users.should == [user]
    end

    it 'should not add the user twice' do
      app.users << user
      subject.save
      app.users.reload.should == [user]
    end

    it 'should not store any invites in the db' do
      expect { subject.save }.to_not change(Invite, :count)
    end
  end

  context 'when creating an invite for a non-registered user' do
    subject { InviteFactory.new(app, :email => 'email@example.com') }

    it 'should store the invite in the database' do
      expect { subject.save }.to change { app.invites.count }.by(1)
      app.invites.last.email.should == 'email@example.com'
    end

    it 'should validate the invite' do
      subject.invite.email = 'foo'
      subject.save.should == false
    end
  end
end
