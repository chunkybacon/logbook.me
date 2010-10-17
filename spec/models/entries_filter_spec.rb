require 'spec_helper'

describe EntriesFilter do
  context 'when returning conditions hash' do
    subject { EntriesFilter.new(@params) }

    it 'should handle emptry attributes' do
      @params = nil
      expect { subject }.to_not raise_error
    end

    it 'should include non-blank attributes' do
      @params = { :severity => 'info' }
      subject.conditions[:severity].should == 'info'
    end

    it 'should not include blank attributes' do
      @params = { :severity => '' }
      subject.conditions.should be_blank
    end
  end
end
