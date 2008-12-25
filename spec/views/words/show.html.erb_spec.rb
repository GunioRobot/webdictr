require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/words/show.html.erb" do
  include WordsHelper
  
  before(:each) do
    assigns[:word] = @word = stub_model(Word,
      :keyword => "value for keyword",
      :definition => "value for definition"
    )
  end

  it "should render attributes in <p>" do
    render "/words/show.html.erb"
    response.should have_text(/value\ for\ keyword/)
    response.should have_text(/value\ for\ definition/)
  end
end

