class Film < ActiveRecord::Base
	has_many :criticas
	has_may :puntuacions
end
