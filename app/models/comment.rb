class Comment < ActiveRecord::Base
	belongs_to :articulo
	belongs_to :critica
end
