require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/dicts/index.html.erb" do
  include DictsHelper

  before(:each) do
    assigns[:dicts] = [
      stub_model(Dict,
        :name => "value for name",
        :description => "value for description"
      ),
      stub_model(Dict,
        :name => "value for name",
        :description => "value for description"
      )
    ]
  end

  it "should render list of dicts" do
    render "/dicts/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
    response.should have_tag("tr>td", "value for description", 2)
  end
end

