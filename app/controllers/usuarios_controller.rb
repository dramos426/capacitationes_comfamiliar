# encoding: utf-8
class UsuariosController < ApplicationController
  
  def create
  	if params[:capacitacion_id].present? && @capacitacion = Capacitacion.find(params[:capacitacion_id])
      @usuario = @capacitacion.usuarios.build(params[:usuario])
    else
      @usuario = Usuario.new(params[:usuario])
    end
  	
  	if @usuario.save && @capacitacion
  		CapacitacionUsuario.create(usuario: @usuario, capacitacion: @capacitacion)
  		redirect_to capacitacion_path(@capacitacion), notice: "El usuario se ha agregado correctamente"
  	elsif @usuario.save && !@capacitacion
      redirect_to usuarios_path, notice: "El usuario se ha agregado correctamente"
    elsif @usuario.errors.any?
      resp = ""
      @usuario.errors.full_messages.each do |msg|
        resp = resp + " - " + msg
      end
  		flash[:alert] = "No se pudo agregar el usuario #{resp}"
      redirect_to "#{@capacitacion ? @capacitacion : usuarios_path}"
  	end
  end

  def destroy
    @usuario = Usuario.find(params[:id])
    if @usuario.destroy
      redirect_to usuarios_path, notice: "El usuario ha sido eliminado correctamente"
    else
      flash[:alert] = "El usuario no se ha podido eliminar"
      redirect_to usuarios_path
    end
  end

  def unlink
    @capacitacion = Capacitacion.find(params[:capacitacion_id])
    @usuario = Usuario.find(params[:usuario_id])
    @capacitacion_usuario = CapacitacionUsuario.where(capacitacion_id: @capacitacion.id, usuario_id: @usuario.id)
    if @capacitacion_usuario.delete
      redirect_to @capacitacion, notice: "El usuario ha sido desvinculado de esta capacitación"
    else
      redirect_to @capacitacion, alert: "El usuario ha podido ser desvinculado de esta capacitación"
    end
  end

  def update
  end

  def index
    @usuarios = Usuario.all
    @usuario = Usuario.new
  end
end
