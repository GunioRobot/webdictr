require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Word do
  before(:each) do
    @word = Word.new
    @valid_attributes = {
      :name => "hello",
      :phonetic => "hə'lou",
      :meaning => "chào" 
    }
  end

  it "should create a new instance given valid attributes" do
    @word.attributes = @valid_attributes
    @word.should be_valid
  end
end
