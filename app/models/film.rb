class Film < ActiveRecord::Base
	has_many :criticas
	has_many :puntuacions
end
