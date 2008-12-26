class Word < ActiveRecord::Base
  belongs_to :dict
  validates_presence_of :keyword
  validates_presence_of :definition

  define_index do
    indexes keyword, :sortable => true
    indexes definition
  end

end
