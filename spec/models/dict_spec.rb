require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Dict do
  before(:each) do
    @dict = Dict.new
    @valid_attributes = {
      :name => "en_vi",
      :description => "English Vietnamese dictionary"
    }
  end

  it "should create a new instance given valid attributes" do
    @dict.attributes = @valid_attributes
    @dict.should be_valid
  end
end
