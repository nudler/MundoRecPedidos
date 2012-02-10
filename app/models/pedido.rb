class Pedido < ActiveRecord::Base
  belongs_to    :evento
  belongs_to    :pedido
  belongs_to    :forma_entrega
  belongs_to    :user
  has_many      :imagen_pedidos
  has_many      :pedidodetalles

  validates_format_of   :email2,
                        :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                        :message => 'Formato de email no valido',
                        :allow_blank => true,
                        :on => :update

  validates_format_of   :fechaevento, :with => /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/,
                        :message => "Formato de fecha no valido.",
                        :on => :update

  validates_presence_of :telefonoparticular, :message => "no puede estar en blanco",
                        :on => :update
  validates_presence_of :nombrecontacto , :message => "no puede estar en blanco",
                        :on => :update
  validates_presence_of :fechaentrega , :message => "Debe introducir una fecha de entrega",
                        :on => :update
  validates_presence_of :horarioentrega , :message => "Debe introducir un horario de entrega",
                        :on => :update

  validates_format_of   :fechaentrega, :with => /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/,
                        :message => "Formato de fecha no valido.",
                        :on => :update

  def descStatus(status)
    case status
      when 0
        'Formulario pendiente de carga'
      when 1
        'Formulario chequeado'
      when 2
        "En proceso de Diseno"
      when 3
        'En proceso de Produccion'
      when 4
        'Producto terminado'
    end
  end

end