require 'spec_helper'

describe Invite do
  it { should belong_to(:application) }
  it { should belong_to(:user) }
end
