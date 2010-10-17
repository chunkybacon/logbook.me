require 'spec_helper'

describe ConfigFilesController do
  context 'on GET to show' do
    let(:application) { Application.make }

    def do_get
      get :show, :id => application.api_key
    end

    it 'should find the application by api_key' do
      do_get
      assigns(:application).should == application
    end

    it 'should set content type to YAML' do
      do_get
      response.content_type.should == Mime::YAML
    end
  end
end
