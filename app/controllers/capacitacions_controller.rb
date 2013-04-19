# encoding: utf-8
class CapacitacionsController < ApplicationController

  def new
    @capacitacion = Capacitacion.new
  end

  def create
    @capacitacion = Capacitacion.new(params[:capacitacion])
    if @capacitacion.save
      redirect_to @capacitacion, notice: "La capacitación ha sido creada correctamente"
    else
      flash[:alert] = "La capacitación no se ha podido crear"
      redirect_to :root
    end
  end

  def index
    @capacitacions = Capacitacion.all
    if @capacitacions.size < 1
      redirect_to new_capacitacion_path, notice: "Aún no se han creado capacitaciones, hágalo ahora!"
    end
  end

  def edit
    @capacitacion = Capacitacion.find(params[:id])
  end

  def destroy
    @capacitacion = Capacitacion.find(params[:id])
    if @capacitacion.destroy
      redirect_to capacitacions_path, notice: "La capacitación ha sido eliminada correctamente"
    else
      flash[:alert] = "La capacitación no se ha podido eliminar"
      redirect_to :root
    end
  end

  def update
    @capacitacion = Capacitacion.find(params[:id])
    if @capacitacion.updates_attributes(params[:capacitacion])
      redirect_to @capacitacion, notice: "La capacitación ha sido actualizada correctamente"
    else
      flash[:alert] = "La capacitación no se ha podido actualizar"
      render :edit
    end
  end

  def show

  end
end
