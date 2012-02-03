class FormaEntrega < ActiveRecord::Base
  has_many  :pedidos
  has_many  :sitio_entregas
end
