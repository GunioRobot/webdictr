require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WordsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "words", :action => "index").should == "/words"
    end

    it "should map #new" do
      route_for(:controller => "words", :action => "new").should == "/words/new"
    end

    it "should map #show" do
      route_for(:controller => "words", :action => "show", :id => 1).should == "/words/1"
    end

    it "should map #edit" do
      route_for(:controller => "words", :action => "edit", :id => 1).should == "/words/1/edit"
    end

    it "should map #update" do
      route_for(:controller => "words", :action => "update", :id => 1).should == "/words/1"
    end

    it "should map #destroy" do
      route_for(:controller => "words", :action => "destroy", :id => 1).should == "/words/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/words").should == {:controller => "words", :action => "index"}
    end

    it "should generate params for #new" do
      params_from(:get, "/words/new").should == {:controller => "words", :action => "new"}
    end

    it "should generate params for #create" do
      params_from(:post, "/words").should == {:controller => "words", :action => "create"}
    end

    it "should generate params for #show" do
      params_from(:get, "/words/1").should == {:controller => "words", :action => "show", :id => "1"}
    end

    it "should generate params for #edit" do
      params_from(:get, "/words/1/edit").should == {:controller => "words", :action => "edit", :id => "1"}
    end

    it "should generate params for #update" do
      params_from(:put, "/words/1").should == {:controller => "words", :action => "update", :id => "1"}
    end

    it "should generate params for #destroy" do
      params_from(:delete, "/words/1").should == {:controller => "words", :action => "destroy", :id => "1"}
    end
  end
end
