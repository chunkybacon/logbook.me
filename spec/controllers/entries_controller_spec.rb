require 'spec_helper'

describe EntriesController do
  context 'on POST to /create' do
    let(:application) { Application.make }

    def do_post(params = {})
      post :create, { :api_key => application.api_key, :entries => [] }.merge(params)
    end

    it 'should find the app by api key' do
      do_post
      assigns[:application].should == application
    end

    it 'should return 401 if api key is invalid' do
      do_post :api_key => 'foo'
      response.code.should == '401'
    end

    it 'should be able to create multiple entries from parameters' do
      expect { do_post :entries => [Entry.plan] }.
        to change { application.entries.count }.by(1)
    end
  end
end
