require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DictsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "dicts", :action => "index").should == "/dicts"
    end
  
    it "should map #new" do
      route_for(:controller => "dicts", :action => "new").should == "/dicts/new"
    end
  
    it "should map #show" do
      route_for(:controller => "dicts", :action => "show", :id => 1).should == "/dicts/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "dicts", :action => "edit", :id => 1).should == "/dicts/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "dicts", :action => "update", :id => 1).should == "/dicts/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "dicts", :action => "destroy", :id => 1).should == "/dicts/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/dicts").should == {:controller => "dicts", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/dicts/new").should == {:controller => "dicts", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/dicts").should == {:controller => "dicts", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/dicts/1").should == {:controller => "dicts", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/dicts/1/edit").should == {:controller => "dicts", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/dicts/1").should == {:controller => "dicts", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/dicts/1").should == {:controller => "dicts", :action => "destroy", :id => "1"}
    end
  end
end
