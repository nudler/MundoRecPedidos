class PedidodetallesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @pedidos = Pedido.find(:all,:conditions=> {:user_id => current_user.id,
                                               :status => 0})


    @pedidodetalles = Pedidodetalle.all
    @pedidodetalle = Pedidodetalle.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pedidodetalles }
    end
  end

  # GET /pedidodetalles/1
  # GET /pedidodetalles/1.json
  def show
    @pedidodetalle = Pedidodetalle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pedidodetalle }
    end
  end

  # GET /pedidodetalles/new
  # GET /pedidodetalles/new.json
  def new
    @pedidodetalle = Pedidodetalle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pedidodetalle }
    end
  end

  # GET /pedidodetalles/1/edit
  def edit
    @pedidodetalle = Pedidodetalle.find(params[:id])
  end

  # POST /pedidodetalles
  # POST /pedidodetalles.json
  def create

    @pedidodetalle = Pedidodetalle.new(params[:pedidodetalle])

    @pedidodetalles = Pedidodetalle.all

    respond_to do |format|
      if @pedidodetalle.save
        format.html { redirect_to pedidodetalles_url, notice: 'Guardado!' }
      else
        render :action => 'index'
      end
    end
  end

  # PUT /pedidodetalles/1
  # PUT /pedidodetalles/1.json
  def update
    @pedidodetalle = Pedidodetalle.find(params[:id])

    respond_to do |format|
      if @pedidodetalle.update_attributes(params[:pedidodetalle])
        format.html { redirect_to @pedidodetalle, notice: 'Pedidodetalle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pedidodetalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidodetalles/1
  # DELETE /pedidodetalles/1.json
  def destroy
    @pedidodetalle = Pedidodetalle.find(params[:id])
    @pedidodetalle.destroy

    respond_to do |format|
      format.html { redirect_to pedidodetalles_url }
      format.json { head :no_content }
    end
  end
end
