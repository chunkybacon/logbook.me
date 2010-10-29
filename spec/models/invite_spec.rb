require 'spec_helper'

describe Invite do
  it { should belong_to(:application) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:email) }
  it { should allow_value('email@example.com').for(:email) }
  it { should_not allow_value('example.com').for(:email) }

  it 'should not allow to create several invites for an app with the same email' do
    Invite.make
    subject.should validate_uniqueness_of(:email).scoped_to(:application_id)
  end
end
