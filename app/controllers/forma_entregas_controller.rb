class FormaEntregasController < ApplicationController
  # GET /forma_entregas
  # GET /forma_entregas.json
  def index
    @forma_entregas = FormaEntrega.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @forma_entregas }
    end
  end

  # GET /forma_entregas/1
  # GET /forma_entregas/1.json
  def show
    @forma_entrega = FormaEntrega.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @forma_entrega }
    end
  end

  # GET /forma_entregas/new
  # GET /forma_entregas/new.json
  def new
    @forma_entrega = FormaEntrega.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @forma_entrega }
    end
  end

  # GET /forma_entregas/1/edit
  def edit
    @forma_entrega = FormaEntrega.find(params[:id])
  end

  # POST /forma_entregas
  # POST /forma_entregas.json
  def create
    @forma_entrega = FormaEntrega.new(params[:forma_entrega])

    respond_to do |format|
      if @forma_entrega.save
        format.html { redirect_to @forma_entrega, notice: 'Forma entrega was successfully created.' }
        format.json { render json: @forma_entrega, status: :created, location: @forma_entrega }
      else
        format.html { render action: "new" }
        format.json { render json: @forma_entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /forma_entregas/1
  # PUT /forma_entregas/1.json
  def update
    @forma_entrega = FormaEntrega.find(params[:id])

    respond_to do |format|
      if @forma_entrega.update_attributes(params[:forma_entrega])
        format.html { redirect_to @forma_entrega, notice: 'Forma entrega was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @forma_entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forma_entregas/1
  # DELETE /forma_entregas/1.json
  def destroy
    @forma_entrega = FormaEntrega.find(params[:id])
    @forma_entrega.destroy

    respond_to do |format|
      format.html { redirect_to forma_entregas_url }
      format.json { head :no_content }
    end
  end
end
