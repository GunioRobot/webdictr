module WordsHelper
  def format_definition(text)
    result = ""
    text.each_line do |line|
      result << "<p> #{line}</p>"
    end 
    result
  end
end
