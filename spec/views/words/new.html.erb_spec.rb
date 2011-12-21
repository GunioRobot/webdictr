require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/words/new.html.erb" do
  include WordsHelper

  before(:each) do
    assigns[:word] = stub_model(Word,
      :new_record? => true,
      :keyword => "value for keyword",
      :definition => "value for definition"
    )
  end

  it "should render new form" do
    render "/words/new.html.erb"

    response.should have_tag("form[action=?][method=post]", words_path) do
      with_tag("input#word_keyword[name=?]", "word[keyword]")
      with_tag("textarea#word_definition[name=?]", "word[definition]")
    end
  end
end


