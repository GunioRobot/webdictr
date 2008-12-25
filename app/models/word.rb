class Word < ActiveRecord::Base
  acts_as_versioned
  belongs_to :dict
  
  define_index do

  end
  define_index do
    indexes keyword, :sortable => true  
    indexes definition
  end

end
