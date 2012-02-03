class Pedido < ActiveRecord::Base
  belongs_to    :evento
  belongs_to    :pedido
  belongs_to    :forma_entrega
  belongs_to    :user
  has_many      :imagen_pedidos

  validates_format_of   :email2,
                        :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                        :message => 'Formato de email no valido',
                        :allow_blank => true

  validates_format_of   :fechaevento, :with => /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/,
                        :message => "Formato de fecha no valido."

  validates_presence_of :telefonoparticular, :message => "no puede estar en blanco"
  validates_presence_of :nombrecontacto , :message => "no puede estar en blanco"
  validates_presence_of :fechaentrega , :message => "Debe introducir una fecha de entrega"
  validates_presence_of :horarioentrega , :message => "Debe introducir un horario de entrega"

  validates_format_of   :fechaentrega, :with => /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/,
                        :message => "Formato de fecha no valido."

  #validates_presence_of :fechacumple, :if =>


  def descStatus(status)
    if status == 0
      'Formulario pendiente de carga'
    #else
    #  if status == 1
    #    'Formulario chequeado'
    #  else if status == 2
    #         'En proceso de Diseño'
    #       else if status == 3
    #              'En proceso de Produccion'
    #            else
    #              'Producto terminado'
    #            end
    #       end
    #  end
    end
  end

end