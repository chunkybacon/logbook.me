require 'spec_helper'

describe EntriesController do
  context 'on POST to /create' do
    let(:application) { Application.make }

    def do_post(params = {})
      post :create, { :api_key => application.api_key, :entries => {} }.merge(params)
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
      before_count = Entry.where(:application_id => application.id).count
      do_post :entries => { 0 => Fabricate.attributes_for(:entry), 1 => Fabricate.attributes_for(:entry) }
      Entry.where(:application_id => application.id).count.should == before_count + 2
    end

    it 'should be able to create single entry from parameters' do
      before_count = Entry.where(:application_id => application.id).count
      do_post :entries => Fabricate.attributes_for(:entry)
      Entry.where(:application_id => application.id).count.should == before_count + 1
    end
  end
end
