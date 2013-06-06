# encoding: utf-8
class UsuariosController < ApplicationController
  def show
  end

  def create
  	@capacitacion = Capacitacion.find(params[:capacitacion_id])
  	@usuario = @capacitacion.usuarios.build(params[:usuario])
  	if @usuario.save
  		CapacitacionUsuario.create(usuario: @usuario, capacitacion: @capacitacion)
  		redirect_to capacitacion_path(@capacitacion), notice: "El usuario se ha agregado correctamente"
  	elsif @usuario.errors.any?
      resp = ""
      @usuario.errors.full_messages.each do |msg|
        resp = resp + " - " + msg
      end
  		flash[:alert] = "No se pudo agregar el usuario #{resp}"
  		redirect_to @capacitacion
  	end
  end

  def destroy
  end

  def update
  end
end
