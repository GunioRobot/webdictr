class Dict
  include DataMapper::Resource
  
  has n, :words

  property :id, Serial
  property :name, String
  property :description, String
end
