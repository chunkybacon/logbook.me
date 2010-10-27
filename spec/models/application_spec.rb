require 'spec_helper'

describe Application do
  subject { Application.new(:name => 'Test') }

  its(:to_s) { should == 'Test' }
end
