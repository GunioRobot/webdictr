require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/dicts/edit.html.erb" do
  include DictsHelper
  
  before(:each) do
    assigns[:dict] = @dict = stub_model(Dict,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "should render edit form" do
    render "/dicts/edit.html.erb"
    
    response.should have_tag("form[action=#{dict_path(@dict)}][method=post]") do
      with_tag('input#dict_name[name=?]', "dict[name]")
      with_tag('input#dict_description[name=?]', "dict[description]")
    end
  end
end


