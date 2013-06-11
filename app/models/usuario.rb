# encoding: utf-8
class Usuario < ActiveRecord::Base
	TIPOS_IDENTIFICACION = {:cedula => "Cédula de ciudadanía", :cedula_ext => "Cédula de extranjería", :pasaporte => "Pasaporte", :tarjeta_ident => "Tarjeta de identidad"}
  CATEGORIAS = {:cat_a => "A", :cat_b => "B", :cat_c => "C", :cat_d => "D", :cat_e => "E"}
  attr_accessible :apellidos, :categoria, :email, :identificacion, :nombres, :telefono, :tipo_identificacion

  validates :nombres, presence: {:message => "no puede estar en blanco"}
  validates :apellidos, presence: {:message => "no puede estar en blanco"}
  validates :categoria, presence: {:message => "no puede estar en blanco"}
  validates :tipo_identificacion, presence: {:message => "no puede estar en blanco"}
  validates :identificacion, presence: {:message => "no puede estar en blanco"}
  validates :categoria, :length => {maximum: 5}
  validates :identificacion, uniqueness: {:message => "no puede repetirse, ya existe un usuario con la identificación digitada"} 

  has_many :capacitacion_usuarios, :dependent => :destroy
  has_many :capacitadors, :through => :capacitacion_usuarios

  def full_name
  	"#{self.nombres} #{self.apellidos}"
  end
end
