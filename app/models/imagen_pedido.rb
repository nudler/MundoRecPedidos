class ImagenPedido < ActiveRecord::Base
  belongs_to :pedido

  has_attached_file :photo
end
