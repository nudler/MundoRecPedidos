class SitioEntregasController < ApplicationController
  # GET /sitio_entregas
  # GET /sitio_entregas.json
  def index
    @sitio_entregas = SitioEntrega.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sitio_entregas }
    end
  end

  # GET /sitio_entregas/1
  # GET /sitio_entregas/1.json
  def show
    @sitio_entrega = SitioEntrega.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sitio_entrega }
    end
  end

  # GET /sitio_entregas/new
  # GET /sitio_entregas/new.json
  def new
    @sitio_entrega = SitioEntrega.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sitio_entrega }
    end
  end

  # GET /sitio_entregas/1/edit
  def edit
    @sitio_entrega = SitioEntrega.find(params[:id])
  end

  # POST /sitio_entregas
  # POST /sitio_entregas.json
  def create
    @sitio_entrega = SitioEntrega.new(params[:sitio_entrega])

    respond_to do |format|
      if @sitio_entrega.save
        format.html { redirect_to @sitio_entrega, notice: 'Sitio entrega was successfully created.' }
        format.json { render json: @sitio_entrega, status: :created, location: @sitio_entrega }
      else
        format.html { render action: "new" }
        format.json { render json: @sitio_entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sitio_entregas/1
  # PUT /sitio_entregas/1.json
  def update
    @sitio_entrega = SitioEntrega.find(params[:id])

    respond_to do |format|
      if @sitio_entrega.update_attributes(params[:sitio_entrega])
        format.html { redirect_to @sitio_entrega, notice: 'Sitio entrega was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sitio_entrega.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sitio_entregas/1
  # DELETE /sitio_entregas/1.json
  def destroy
    @sitio_entrega = SitioEntrega.find(params[:id])
    @sitio_entrega.destroy

    respond_to do |format|
      format.html { redirect_to sitio_entregas_url }
      format.json { head :no_content }
    end
  end
end
