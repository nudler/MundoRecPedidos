class AdminController < ActionController::Base
  layout "application"
  protect_from_forgery
  before_filter :authenticate_user!

  def index
    @pedidos = Pedido.find(:all,:conditions=> {:status => [0,1,2,3]},
                                               :order => "fechaentrega asc")

  end

  def changeStatus


  end
end
