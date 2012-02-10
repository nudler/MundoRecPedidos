class Evento < ActiveRecord::Base

  validates_presence_of :descripcion, :iscumple
  has_many :pedidos

end

