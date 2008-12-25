class Word < ActiveRecord::Base
  belongs_to :dict
  
  define_index do
    indexes keyword, :sortable => true  
    indexes definition
  end

end
