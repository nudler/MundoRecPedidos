class PedidosController < ApplicationController
  before_filter :authenticate_user!

  def index
    @pedidos = Pedido.find(:all,:conditions=> {:user_id => current_user.id})

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pedido_detalles }
    end

  end

  def show
    begin
      @pedido = Pedido.find(params[:id])
      unless @pedido.user.id == current_user.id || @pedido.user.isadmin
        redirect_to pedidos_path, notice: 'Usted no tiene acceso a ese pedido'
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to pedidos_path, notice: 'El pedido es inexistente.'
    end
  end

  def new

    @pedidos = Pedido.find(:all,:conditions=> {:status => [0], :user_id => current_user.id})
    if @pedidos.empty?
      @pedido = Pedido.new
      @pedido.email1 = current_user.email
      @pedido.user_id = current_user.id
      @pedido.fechacarga = Date.today
      @pedido.status = 0
      @pedido.save
    else
      @pedido = @pedidos[0]
    end

  end

  def edit
    @pedido = Pedido.find(params[:id])
  end

  def create
    @pedido = Pedido.new(params[:pedido])

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to pedidos_path, notice: 'Pedido was successfully created.' }
        format.json { render json: @pedido, status: :created, location: @pedido }
      else
        format.html { render action: "new" }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @pedido = Pedido.find(params[:id])
    @pedido.evento_id = :evento_id
    @pedido.fechaevento = :fechaevento
    @pedido.nombre = :nombre
    @pedido.fechacumple = :fechacumple
    @pedido.aniosacumplir = :aniosacumplir
    @pedido.tematica = :tematica
    @pedido.colores = :colores
    @pedido.nombrecontacto = :nombrecontacto
    @pedido.telefonoparticular = :telefonoparticular
    @pedido.telalternativo = :telalternativo
    @pedido.email2 = :email2
    @pedido.forma_entrega_id = :forma_entrega_id
    @pedido.sitio_entrega_id = :sitio_entrega_id
    @pedido.domicilio = :domicilio
    @pedido.entrecalles = :entrecalles
    @pedido.barrio = :barrio
    @pedido.codpos = :codpos
    @pedido.localidad = :localidad
    @pedido.provincia = :provincia
    @pedido.fechaentrega = :fechaentrega
    @pedido.horarioentrega = :horarioentrega


    respond_to do |format|
      if @pedido.update_attributes(params[:pedido])
        format.html { redirect_to imagen_pedidos_path, notice: 'Su pedido ha sido guardado.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pedido = Pedido.find(params[:id])
    @pedido.destroy

    respond_to do |format|
      format.html { redirect_to pedido_url }
      format.json { head :no_content }
    end
  end

end
