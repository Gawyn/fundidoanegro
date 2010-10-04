class Especial < ActiveRecord::Base
    has_attached_file :image,
	 :storage => :s3,
	 :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
	 :path => ":attachment/especial/:id/:style.:extension"
	has_many :articulos
	has_many :criticas
end
