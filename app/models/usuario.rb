# encoding: utf-8
class Usuario < ActiveRecord::Base
	TIPOS_IDENTIFICACION = {:cedula => "Cédula de ciudadanía", :cedula_ext => "Cédula de extranjería", :pasaporte => "Pasaporte", :tarjeta_ident => "Tarjeta de identidad"}
  CATEGORIAS = {:cat_a => "A", :cat_b => "B", :cat_c => "C", :cat_c => "D"}
  attr_accessible :apellidos, :categoria, :email, :identificacion, :nombres, :telefono, :tipo_identificacion

  validates :nombres, presence: true
  validates :apellidos, presence: true
  validates :categoria, presence: true
  validates :tipo_identificacion, presence: true
  validates :identificacion, presence: true
  validates :categoria, :length => {maximum: 1}

  has_many :capacitacion_usuarios
  has_many :capacitadors, :trought => :capacitacion_usuarios

  def full_name
  	"#{self.nombres} #{self.apellidos}"
  end
end
