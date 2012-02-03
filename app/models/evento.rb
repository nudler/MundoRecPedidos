class Evento < ActiveRecord::Base

  validates_presence_of :descripcion
  has_many :pedidos


end

