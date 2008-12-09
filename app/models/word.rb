class Word
  include DataMapper::Resource
  
  property :id, Serial

  property :name, String
  property :phonetic, String
  property :meaning, Text

end
