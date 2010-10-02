class Critico < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :firma
	has_many :puntuacions

	def puntuacion_attributes=(puntuacion_attributes)
	  puntuacion_attributes.each do |attributes|
	    puntuacion.build(attributes)
	  end
	end
end
