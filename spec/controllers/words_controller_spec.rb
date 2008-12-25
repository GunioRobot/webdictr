require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WordsController do

  def mock_word(stubs={})
    @mock_word ||= mock_model(Word, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all words as @words" do
      Word.should_receive(:find).with(:all).and_return([mock_word])
      get :index
      assigns[:words].should == [mock_word]
    end

    describe "with mime type of xml" do
  
      it "should render all words as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Word.should_receive(:find).with(:all).and_return(words = mock("Array of Words"))
        words.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested word as @word" do
      Word.should_receive(:find).with("37").and_return(mock_word)
      get :show, :id => "37"
      assigns[:word].should equal(mock_word)
    end
    
    describe "with mime type of xml" do

      it "should render the requested word as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Word.should_receive(:find).with("37").and_return(mock_word)
        mock_word.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new word as @word" do
      Word.should_receive(:new).and_return(mock_word)
      get :new
      assigns[:word].should equal(mock_word)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested word as @word" do
      Word.should_receive(:find).with("37").and_return(mock_word)
      get :edit, :id => "37"
      assigns[:word].should equal(mock_word)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created word as @word" do
        Word.should_receive(:new).with({'these' => 'params'}).and_return(mock_word(:save => true))
        post :create, :word => {:these => 'params'}
        assigns(:word).should equal(mock_word)
      end

      it "should redirect to the created word" do
        Word.stub!(:new).and_return(mock_word(:save => true))
        post :create, :word => {}
        response.should redirect_to(word_url(mock_word))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved word as @word" do
        Word.stub!(:new).with({'these' => 'params'}).and_return(mock_word(:save => false))
        post :create, :word => {:these => 'params'}
        assigns(:word).should equal(mock_word)
      end

      it "should re-render the 'new' template" do
        Word.stub!(:new).and_return(mock_word(:save => false))
        post :create, :word => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested word" do
        Word.should_receive(:find).with("37").and_return(mock_word)
        mock_word.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :word => {:these => 'params'}
      end

      it "should expose the requested word as @word" do
        Word.stub!(:find).and_return(mock_word(:update_attributes => true))
        put :update, :id => "1"
        assigns(:word).should equal(mock_word)
      end

      it "should redirect to the word" do
        Word.stub!(:find).and_return(mock_word(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(word_url(mock_word))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested word" do
        Word.should_receive(:find).with("37").and_return(mock_word)
        mock_word.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :word => {:these => 'params'}
      end

      it "should expose the word as @word" do
        Word.stub!(:find).and_return(mock_word(:update_attributes => false))
        put :update, :id => "1"
        assigns(:word).should equal(mock_word)
      end

      it "should re-render the 'edit' template" do
        Word.stub!(:find).and_return(mock_word(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested word" do
      Word.should_receive(:find).with("37").and_return(mock_word)
      mock_word.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the words list" do
      Word.stub!(:find).and_return(mock_word(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(words_url)
    end

  end

end
