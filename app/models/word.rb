class Word
  include DataMapper::Resource
  
  belongs_to :dict  
  
  property :id, Serial

  property :dict_id, Integer
  property :keyword, String
  property :definition, Text
 
end
