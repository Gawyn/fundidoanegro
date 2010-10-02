class PuntuacionsController < ApplicationController
	before_filter :authenticate_critico!, :except => [:index]
  # GET /puntuacions
  # GET /puntuacions.xml
  def index
	@criticos = Critico.find(:all, :order => 'id')
	@puntuaciones = Puntuacion.find(:all, :order => 'film_id,critico_id')
	if critico_signed_in?
	@critico = Critico.find_by_id(current_critico.id)
	end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @puntuacions }
    end
  end

  # GET /puntuacions/1
  # GET /puntuacions/1.xml
  def show
    @puntuacion = Puntuacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @puntuacion }
    end
  end

  # GET /puntuacions/new
  # GET /puntuacions/new.xml
  def new
    @puntuacion = Puntuacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @puntuacion }
    end
  end

def edit_all
	@puntuaciones = Puntuacion.find(:all, :conditions => {:critico_id => current_critico.id})
	@critico = Critico.find(current_critico.id)
    	respond_to do |format|
      		format.html
	end
end

  # GET /puntuacions/1/edit
  def edit
    @puntuacion = Puntuacion.find(params[:id])
  end

  # POST /puntuacions
  # POST /puntuacions.xml
  def create
    @puntuacion = Puntuacion.new(params[:puntuacion])

    respond_to do |format|
      if @puntuacion.save
        format.html { redirect_to(@puntuacion, :notice => 'Puntuacion was successfully created.') }
        format.xml  { render :xml => @puntuacion, :status => :created, :location => @puntuacion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @puntuacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /puntuacions/1
  # PUT /puntuacions/1.xml
  def update
    @puntuacion = Puntuacion.find(params[:id])

    respond_to do |format|
      if @puntuacion.update_attributes(params[:puntuacion])
        format.html { redirect_to(@puntuacion, :notice => 'Puntuacion was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @puntuacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /puntuacions/1
  # DELETE /puntuacions/1.xml
  def destroy
    @puntuacion = Puntuacion.find(params[:id])
    @puntuacion.destroy

    respond_to do |format|
      format.html { redirect_to(puntuacions_url) }
      format.xml  { head :ok }
    end
  end
end
