require 'spec_helper'

module Happy::Resources
  describe "a controller derived from ResourceController" do
    subject do
      class MyApp < ResourceController
        def index ; 'index' ; end
        def new ; 'new' ; end
        def create ; 'create' ; end
        def show ; "show #{params['id']}" ; end
        def edit ; "edit #{params['id']}" ; end
        def update ; "update #{params['id']}" ; end
        def destroy ; "destroy #{params['id']}" ; end
      end

      MyApp
    end

    it "dispatches GET / requests to #index" do
      response_for { get '/' }.body.should == 'index'
    end

    it "dispatches GET /new requests to #new" do
      response_for { get '/new' }.body.should == 'new'
    end

    it "dispatches POST / requests to #create" do
      response_for { post '/' }.body.should == 'create'
    end

    it "dispatches GET /:id requests to #show" do
      response_for { get '/123' }.body.should == 'show 123'
    end

    it "dispatches GET /:id/edit requests to #edit" do
      response_for { get '/123/edit' }.body.should == 'edit 123'
    end

    it "dispatches PUT /:id requests to #update" do
      response_for { put '/123' }.body.should == 'update 123'
    end

    it "dispatches DELETE /:id requests to #destroy" do
      response_for { delete '/123' }.body.should == 'destroy 123'
    end
  end
end
