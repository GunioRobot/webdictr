require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/dicts/show.html.erb" do
  include DictsHelper

  before(:each) do
    assigns[:dict] = @dict = stub_model(Dict,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "should render attributes in <p>" do
    render "/dicts/show.html.erb"
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
  end
end

