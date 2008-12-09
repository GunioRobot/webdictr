require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a dict exists" do
  Dict.all.destroy!
  request(resource(:dicts), :method => "POST", 
    :params => { :dict => { :id => nil }})
end

describe "resource(:dicts)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:dicts))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of dicts" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a dict exists" do
    before(:each) do
      @response = request(resource(:dicts))
    end
    
    it "has a list of dicts" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Dict.all.destroy!
      @response = request(resource(:dicts), :method => "POST", 
        :params => { :dict => { :id => nil }})
    end
    
    it "redirects to resource(:dicts)" do
      @response.should redirect_to(resource(Dict.first), :message => {:notice => "dict was successfully created"})
    end
    
  end
end

describe "resource(@dict)" do 
  describe "a successful DELETE", :given => "a dict exists" do
     before(:each) do
       @response = request(resource(Dict.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:dicts))
     end

   end
end

describe "resource(:dicts, :new)" do
  before(:each) do
    @response = request(resource(:dicts, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@dict, :edit)", :given => "a dict exists" do
  before(:each) do
    @response = request(resource(Dict.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@dict)", :given => "a dict exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Dict.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @dict = Dict.first
      @response = request(resource(@dict), :method => "PUT", 
        :params => { :dict => {:id => @dict.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@dict))
    end
  end
  
end

