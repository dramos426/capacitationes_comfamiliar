class CapacitacionUsuario < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :capacitacion
  # attr_accessible :title, :body
  validates_presence_of :usuario, :capacitacion
end
