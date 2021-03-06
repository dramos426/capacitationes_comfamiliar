# encoding: utf-8
class UsuariosController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:add_user_to_cap]
  def create
  	@capacitacion = Capacitacion.find(params[:capacitacion_id]) if params[:capacitacion_id].present?
    @usuario = Usuario.new(params[:usuario])
  	
  	if @usuario.save && @capacitacion		
  		if CapacitacionUsuario.create(:usuario_id => @usuario.id, :capacitacion_id => @capacitacion.id)
        redirect_to capacitacion_path(@capacitacion), notice: "El usuario se ha agregado correctamente."
      else
        redirect_to capacitacion_path(@capacitacion), alert: "El usuario se ha creado, pero no se pudo agregar a la capacitación."
      end
  	elsif @usuario.save && !@capacitacion
      redirect_to usuarios_path, notice: "El usuario se ha agregado correctamente."
    elsif @usuario.errors.any?
      resp = ""
      @usuario.errors.full_messages.each do |msg|
        resp = resp + " - " + msg
      end
  		flash[:alert] = "No se pudo agregar el usuario #{resp}."
      redirect_to "#{@capacitacion ? @capacitacion : usuarios_path}"
  	end
  end

  def destroy
    @usuario = Usuario.find(params[:id])
    if @usuario.destroy
      redirect_to usuarios_path, notice: "El usuario ha sido eliminado correctamente."
    else
      flash[:alert] = "El usuario no se ha podido eliminar."
      redirect_to usuarios_path
    end
  end

  def update
    @usuario = Usuario.find(params[:id])
    if @usuario.update_attributes(params[:usuario])
      redirect_to usuarios_path, notice: "El usuario ha sido actualizado correctamente."
    else
      flash[:alert] = "El usuario no se ha podido actualizar."
      redirect_to usuarios_path
    end
  end

  def index
    @usuarios = Usuario.order("apellidos ASC").page(params[:page]).per(10)
    @usuario = Usuario.new
  end

  def search
    usuario = Usuario.find_by_identificacion(params[:user_identificacion])
    @capacitacion = Capacitacion.find(params[:capacitacion_id])
    @resp = {
      capacitacion_id: params[:capacitacion_id],
      found: usuario.present?,
      user: usuario
    }
  end

  def add_user_to_cap
    capacitacion = Capacitacion.find(params[:capacitacion_id])
    usuario = Usuario.find(params[:usuario_id])
    cap_usuario = CapacitacionUsuario.new(usuario_id: usuario.id, capacitacion_id: capacitacion.id)
    if !cap_usuario.save
      redirect_to capacitacion, notice: "El usuario no pudo ser añadido a esta capacitación"
    end
    render :nothing => true
  end

  def unlink
    @capacitacion = Capacitacion.find(params[:capacitacion_id])
    @usuario = Usuario.find(params[:usuario_id])
    @capacitacion_usuario = CapacitacionUsuario.find_by_capacitacion_id_and_usuario_id(@capacitacion.id, @usuario.id)
    @resp = { deleted: @capacitacion_usuario.delete }
    respond_to do |format|
      format.js
    end
  end

end
