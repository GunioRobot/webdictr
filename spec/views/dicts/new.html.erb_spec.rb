require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/dicts/new.html.erb" do
  include DictsHelper
  
  before(:each) do
    assigns[:dict] = stub_model(Dict,
      :new_record? => true,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "should render new form" do
    render "/dicts/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", dicts_path) do
      with_tag("input#dict_name[name=?]", "dict[name]")
      with_tag("input#dict_description[name=?]", "dict[description]")
    end
  end
end


