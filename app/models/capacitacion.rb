class Capacitacion < ActiveRecord::Base
  attr_accessible :fecha, :institucion, :observaciones, :tema, :valor_base, :valor_cat_a, :valor_cat_b, :valor_cat_c, :valor_cat_d, :valor_cat_e, :capacitador_id
  
  validates :valor_base, :presence => {:message => "No puede estar en blanco"}
  validates :valor_cat_a, :presence => {:message => "No puede estar en blanco"}
  validates :valor_cat_b, :presence => {:message => "No puede estar en blanco"}
  validates :valor_cat_c, :presence => {:message => "No puede estar en blanco"}
  validates :valor_cat_d, :presence => {:message => "No puede estar en blanco"}
  validates :tema, :presence => {:message => "No puede estar en blanco"}
  validates :institucion, :presence => {:message => "No puede estar en blanco"}
  validates :fecha, :presence => {:message => "No puede estar en blanco"}
  validates :capacitador_id, :presence => {:message => "Debe elegir un capacitador"}


  belongs_to :capacitador
  has_many :capacitacion_usuarios
  has_many :usuarios, :through => :capacitacion_usuarios
end