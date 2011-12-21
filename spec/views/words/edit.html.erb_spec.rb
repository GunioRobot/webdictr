require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/words/edit.html.erb" do
  include WordsHelper

  before(:each) do
    assigns[:word] = @word = stub_model(Word,
      :new_record? => false,
      :keyword => "value for keyword",
      :definition => "value for definition"
    )
  end

  it "should render edit form" do
    render "/words/edit.html.erb"

    response.should have_tag("form[action=#{word_path(@word)}][method=post]") do
      with_tag('input#word_keyword[name=?]', "word[keyword]")
      with_tag('textarea#word_definition[name=?]', "word[definition]")
    end
  end
end


