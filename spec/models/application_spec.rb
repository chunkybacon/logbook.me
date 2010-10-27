require 'spec_helper'

describe Application do
  subject { Application.new(:name => 'Test') }

  it { should have_many(:users) }
  it { should have_one(:owner) }
  it { should have_many(:invites) }

  its(:to_s) { should == 'Test' }
end
