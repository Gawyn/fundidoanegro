class Articulo < ActiveRecord::Base
    has_attached_file :image
	belongs_to :especial
	belongs_to :user
end
