class Capacitador < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :nombres, :apellidos, :tipo_identificacion, :identificacion

  validates_presence_of :nombres, :apellidos, :tipo_identificacion, :identificacion

  has_many :capacitacions

  def full_name
  	"#{self.nombres} #{self.apellidos}"
  end
end
