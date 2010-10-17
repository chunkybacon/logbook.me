require 'spec_helper'

describe EntriesFilter do
  context 'when returning conditions hash' do
    subject { EntriesFilter.new(@params) }

    %w(severity facility
       time_frame time_from time_to).each do |attr|
      it "it should have #{attr} attribute" do
        subject.should respond_to(attr)
      end
    end

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

    context 'when interpeting timeframe' do
      it 'should set timestamp to beginning of today if timeframe is today' do
        @params = { :time_frame => 'Today' }
        subject.conditions.should == {
          :timestamp => { '$gte' => Time.zone.now.beginning_of_day }
        }
      end

      it 'should set timestamp to yesterday if timeframe is yesterday' do
        @params = { :time_frame => 'Yesterday' }
        subject.conditions.should == {
          :timestamp => {
            '$gte' => 1.day.ago.utc.beginning_of_day,
            '$lt' => Time.zone.now.beginning_of_day 
          }
        }
      end

      it 'should use time_from and time_to if timeframe is set to custom' do
        time_from = Time.zone.parse('17 Oct 17:00')
        time_to = Time.zone.parse('17 Oct 18:00')

        @params = {
          :time_frame => 'Custom',
          :time_from => '17 Oct 17:00',
          :time_to => '17 Oct 18:00'
        }

        subject.conditions.should == {
          :timestamp => { '$gte' => time_from, '$lte' => time_to }
        }
      end
    end
  end
end
