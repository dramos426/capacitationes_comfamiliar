class CapacitacionUsuario < ActiveRecord::Base
  attr_accessible :usuario_id, :capacitacion_id
  belongs_to :usuario
  belongs_to :capacitacion
  validates_presence_of :usuario, :capacitacion
  validates_uniqueness_of :usuario_id, :scope => :capacitacion
end
