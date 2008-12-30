module WordsHelper
  def format_definition(text)
    result = "<ul>"
    text.each_line do |line|
      result << line.sub(/^\*(.+)/,'<li class="wordtype">\1</li>') if line.match /^\*.*/
      result << line.sub(/^\-(.+)/,'<li class="meaning">\1</li>') if line.match /^\-.*/
      result << line.sub(/^\#(.+)/,'<li class="antonym">\1</li>') if line.match /^\#.*/
      result << line.sub(/^\=(.+)\+(.*)/,'<li class="example">\1</li> <li class="example-meaning">\2</li>') if line.match /^\=.*\+.*/
      result << line.sub(/^\=([^\+]+)/,'<li class="example">\1</li>') if line.match /^\=\[^\+]+/
    end
    result << "</ul>"
  end
end
