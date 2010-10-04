class Articulo < ActiveRecord::Base
    has_attached_file :image,
	 :storage => :s3,
	 :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
	 :path => ":attachment/articulo/:id/:style.:extension"
	belongs_to :especial
	belongs_to :user
end
