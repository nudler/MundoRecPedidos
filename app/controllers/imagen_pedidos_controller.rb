class ImagenPedidosController < ApplicationController
  # GET /imagen_pedidos
  # GET /imagen_pedidos.json
  def index
    # = ImagenPedido.all
    @pedidos = Pedido.find(:all,:conditions=> {:status => [0], :user_id => current_user.id})
    @imagen_pedidos = @pedidos[0].imagen_pedidos
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @imagen_pedidos }
    end
  end

  # GET /imagen_pedidos/1
  # GET /imagen_pedidos/1.json
  def show
    @imagen_pedido = ImagenPedido.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @imagen_pedido }
      format.xml { render xml: @imagen_pedido }

    end
  end

  # GET /imagen_pedidos/new
  # GET /imagen_pedidos/new.json
  def new
    @imagen_pedido = ImagenPedido.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @imagen_pedido }
    end
  end

  # GET /imagen_pedidos/1/edit
  def edit
    @imagen_pedido = ImagenPedido.find(params[:id])
  end

  # POST /imagen_pedidos
  # POST /imagen_pedidos.json
  def create
    @imagen_pedido = ImagenPedido.new(params[:imagen_pedido])
    @pedidos = Pedido.find(:all,:conditions=> {:status => [0], :user_id => current_user.id})
    @imagen_pedido.pedido_id = @pedidos[0].id
    respond_to do |format|
      if @imagen_pedido.save
        format.html { redirect_to imagen_pedidos_path, notice: 'La imagen fue subida satisfactoriamente.' }
        format.json { render json: @imagen_pedido, status: :created, location: @imagen_pedido }
      else
        format.html { render action: "new" }
        format.json { render json: @imagen_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /imagen_pedidos/1
  # PUT /imagen_pedidos/1.json
  def update
    @imagen_pedido = ImagenPedido.find(params[:id])

    respond_to do |format|
      if @imagen_pedido.update_attributes(params[:imagen_pedido])
        format.html { redirect_to @imagen_pedido, notice: 'Imagen pedido was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @imagen_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imagen_pedidos/1
  # DELETE /imagen_pedidos/1.json
  def destroy
    @imagen_pedido = ImagenPedido.find(params[:id])
    @imagen_pedido.destroy

    respond_to do |format|
      format.html { redirect_to imagen_pedidos_url }
      format.json { head :no_content }
    end
  end
end
