require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DictsController do

  def mock_dict(stubs={})
    @mock_dict ||= mock_model(Dict, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all dicts as @dicts" do
      Dict.should_receive(:find).with(:all).and_return([mock_dict])
      get :index
      assigns[:dicts].should == [mock_dict]
    end

    describe "with mime type of xml" do
  
      it "should render all dicts as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Dict.should_receive(:find).with(:all).and_return(dicts = mock("Array of Dicts"))
        dicts.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested dict as @dict" do
      Dict.should_receive(:find).with("37").and_return(mock_dict)
      get :show, :id => "37"
      assigns[:dict].should equal(mock_dict)
    end
    
    describe "with mime type of xml" do

      it "should render the requested dict as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Dict.should_receive(:find).with("37").and_return(mock_dict)
        mock_dict.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new dict as @dict" do
      Dict.should_receive(:new).and_return(mock_dict)
      get :new
      assigns[:dict].should equal(mock_dict)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested dict as @dict" do
      Dict.should_receive(:find).with("37").and_return(mock_dict)
      get :edit, :id => "37"
      assigns[:dict].should equal(mock_dict)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created dict as @dict" do
        Dict.should_receive(:new).with({'these' => 'params'}).and_return(mock_dict(:save => true))
        post :create, :dict => {:these => 'params'}
        assigns(:dict).should equal(mock_dict)
      end

      it "should redirect to the created dict" do
        Dict.stub!(:new).and_return(mock_dict(:save => true))
        post :create, :dict => {}
        response.should redirect_to(dict_url(mock_dict))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved dict as @dict" do
        Dict.stub!(:new).with({'these' => 'params'}).and_return(mock_dict(:save => false))
        post :create, :dict => {:these => 'params'}
        assigns(:dict).should equal(mock_dict)
      end

      it "should re-render the 'new' template" do
        Dict.stub!(:new).and_return(mock_dict(:save => false))
        post :create, :dict => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested dict" do
        Dict.should_receive(:find).with("37").and_return(mock_dict)
        mock_dict.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :dict => {:these => 'params'}
      end

      it "should expose the requested dict as @dict" do
        Dict.stub!(:find).and_return(mock_dict(:update_attributes => true))
        put :update, :id => "1"
        assigns(:dict).should equal(mock_dict)
      end

      it "should redirect to the dict" do
        Dict.stub!(:find).and_return(mock_dict(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(dict_url(mock_dict))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested dict" do
        Dict.should_receive(:find).with("37").and_return(mock_dict)
        mock_dict.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :dict => {:these => 'params'}
      end

      it "should expose the dict as @dict" do
        Dict.stub!(:find).and_return(mock_dict(:update_attributes => false))
        put :update, :id => "1"
        assigns(:dict).should equal(mock_dict)
      end

      it "should re-render the 'edit' template" do
        Dict.stub!(:find).and_return(mock_dict(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested dict" do
      Dict.should_receive(:find).with("37").and_return(mock_dict)
      mock_dict.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the dicts list" do
      Dict.stub!(:find).and_return(mock_dict(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(dicts_url)
    end

  end

end
