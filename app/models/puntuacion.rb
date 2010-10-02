class Puntuacion < ActiveRecord::Base
	belongs_to :critico
	belongs_to :film
end
