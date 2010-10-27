require 'spec_helper'

describe ApplicationMembership do
  it { should belong_to(:application) }
  it { should belong_to(:user) }

  it 'should mark the first user of the app as owner' do
    subject.user = User.make_unsaved
    subject.application = Application.make_unsaved
    subject.save!
    subject.should be_owner
  end
end
