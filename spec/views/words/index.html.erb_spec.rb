require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/words/index.html.erb" do
  include WordsHelper

  before(:each) do
    assigns[:words] = [
      stub_model(Word,
        :keyword => "value for keyword",
        :definition => "value for definition"
      ),
      stub_model(Word,
        :keyword => "value for keyword",
        :definition => "value for definition"
      )
    ]
  end

  it "should render list of words" do
    render "/words/index.html.erb"
    response.should have_tag("tr>td", "value for keyword", 2)
    response.should have_tag("tr>td", "value for definition", 2)
  end
end

