class Category < ActiveRecord::Base

  validates_presence_of :descripcion
  belongs_to  :category
  has_many    :productos

end
