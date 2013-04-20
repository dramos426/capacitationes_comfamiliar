class Capacitacion < ActiveRecord::Base
  attr_accessible :fecha, :institucion, :observaciones, :tema, :valor, :capacitador_id
  
  validates :valor, :presence => {:message => "No puede estar en blanco"}
  validates :tema, :presence => {:message => "No puede estar en blanco"}
  validates :institucion, :presence => {:message => "No puede estar en blanco"}
  validates :fecha, :presence => {:message => "No puede estar en blanco"}
  validates :capacitador_id, :presence => {:message => "Debe elegir un capacitador"}


  belongs_to :capacitador
  has_many :capacitacion_usuarios
  has_many :usuarios, :through => :capacitacion_usuarios
end