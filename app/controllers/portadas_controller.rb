class PortadasController < ApplicationController
	before_filter :authenticate_admin!, :except => [:index, :show]
  def show
    	@articulos = Articulo.find(:all, :conditions => {:portada => true}, :order => "created_at DESC")
    	@especials = Especial.find(:all, :conditions => {:portada => true})
    	@criticas = Critica.find(:all, :conditions => {:portada => true})
    	@noticias = Noticia.find(:all)
	@articulosnot = Articulo.find(:all, :conditions => {:portada => false}, :order => "created_at DESC")
    	@especialsnot = Especial.find(:all, :conditions => {:portada => false}, :order => "created_at DESC")
	@tots = @articulosnot + @especialsnot;
    respond_to do |format|
      format.html # index.html.erb
    end
  end

end
