require 'spec_helper'

describe ApplicationMembership do
  it { should belong_to(:application) }
  it { should belong_to(:user) }
end
