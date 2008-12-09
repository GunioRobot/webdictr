require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a word exists" do
  Word.all.destroy!
  request(resource(:words), :method => "POST", 
    :params => { :word => { :id => nil }})
end

describe "resource(:words)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:words))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of words" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a word exists" do
    before(:each) do
      @response = request(resource(:words))
    end
    
    it "has a list of words" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Word.all.destroy!
      @response = request(resource(:words), :method => "POST", 
        :params => { :word => { :id => nil }})
    end
    
    it "redirects to resource(:words)" do
      @response.should redirect_to(resource(Word.first), :message => {:notice => "word was successfully created"})
    end
    
  end
end

describe "resource(@word)" do 
  describe "a successful DELETE", :given => "a word exists" do
     before(:each) do
       @response = request(resource(Word.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:words))
     end

   end
end

describe "resource(:words, :new)" do
  before(:each) do
    @response = request(resource(:words, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@word, :edit)", :given => "a word exists" do
  before(:each) do
    @response = request(resource(Word.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@word)", :given => "a word exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Word.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @word = Word.first
      @response = request(resource(@word), :method => "PUT", 
        :params => { :word => {:id => @word.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@word))
    end
  end
  
end

