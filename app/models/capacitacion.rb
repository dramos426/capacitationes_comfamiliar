class Capacitacion < ActiveRecord::Base
  attr_accessible :fecha, :institucion, :observaciones, :tema, :valor, :capacitador_id
  validates_presence_of :fecha, :institucion, :tema, :valor

  belongs_to :capacitador
  has_many :usuarios
  has_many :capacitacion_usuarios
end