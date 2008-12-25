require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Word do
  before(:each) do
    @valid_attributes = {
      :dict_id => "1",
      :keyword => "value for keyword",
      :definition => "value for definition"
    }
  end

  it "should create a new instance given valid attributes" do
    Word.create!(@valid_attributes)
  end
end
