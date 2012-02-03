class EventosController < ApplicationController

  before_filter :authenticate_user!


  def index
    @evento = Evento.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @evento_detalles }
    end

  end

  def show
    @evento = Evento.find(params[:id])
  end

  def new
    @evento = Evento.new
  end

  def edit
    @evento = Evento.find(params[:id])
  end

  def create
    @evento = Evento.new(params[:evento])

    respond_to do |format|
      if @evento.save
        format.html { redirect_to eventos_path, notice: 'Evento was successfully created.' }
        format.json { render json: @evento, status: :created, location: @evento }
      else
        format.html { render action: "new" }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @evento = Evento.find(params[:id])

    respond_to do |format|
      if @evento.update_attributes(params[:evento])
        format.html { redirect_to @evento, notice: 'Evento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @evento = Evento.find(params[:id])
    @evento.destroy

    respond_to do |format|
      format.html { redirect_to evento_url }
      format.json { head :no_content }
    end
  end
end
