class Capacitacion < ActiveRecord::Base
  attr_accessible :fecha, :institucion, :observaciones, :tema, :valor, :capacitador_id
  
  validates :valor, :presence => {:message => "No puede estar en blanco"}
  validates :tema, :presence => {:message => "No puede estar en blanco"}
  validates :institucion, :presence => {:message => "No puede estar en blanco"}
  validates :fecha, :presence => {:message => "No puede estar en blanco"}


  belongs_to :capacitador
  has_many :usuarios
  has_many :capacitacion_usuarios
end