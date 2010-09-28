class PortadasController < ApplicationController
	before_filter :authenticate_admin!, :except => [:index, :show]
  def show
    	@articulos = Articulo.find(:all, :conditions => {:portada => true})
    	@especials = Especial.find(:all, :conditions => {:portada => true})
    	@criticas = Critica.find(:all, :conditions => {:portada => true})
    	@noticias = Noticia.find(:all)
    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
