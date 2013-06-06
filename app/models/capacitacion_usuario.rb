class CapacitacionUsuario < ActiveRecord::Base
  attr_accessible :usuario, :capacitacion
  belongs_to :usuario
  belongs_to :capacitacion
  validates_presence_of :usuario, :capacitacion
end
