class Especial < ActiveRecord::Base
    has_attached_file :image
	has_many :articulos
	has_many :criticas
end
